class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

    

  def new
    @customer = Customer.new        
  end

  def create
        @customer = Customer.create(customer_params)
        if @customer.save
          params[:customer][:password]
          session[:customer_id] = @customer.id
          redirect_to customer_path(@customer)
        else
          if Customer.find_by(username: params[:customer][:username]) || Customer.find(email: params[:customer][:email])
            flash[:alert] = "Looks like you've already signed up!"
            redirect_to login_path
          else 
            render :new
          end 
        end 
      end
      

      def show 
            
      end
      def edit

      end

      def update
        authenticate 
        @customer.update(customer_params)
          if @customer.save
            redirect_to customer_path(@customer)
          else 
            flash[:notice] = "Your account was not updated. Please check your username & password."     
            render :edit
          end 
      end

    
    private
    def customer_params
        params.require(:customer).permit(:username, :email, :password)
      end  
    
    def set_customer
        @customer = Customer.find(params[:id])
    end
    
end