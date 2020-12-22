class TiersController < ApplicationController
    # before_action :set_cake, only: [:index, :create]
    before_action :set_customer
    
    
    def index
       
        @cake = Cake.find_by(id: params[:cake_id])
        @tier = Tier.find_by(id: params[:id])
        # @tier = Tier.find(params[:id])
        # @tier.cake = @cake
    
    end

    def new 
          
        @cake = Cake.find(params[:cake_id]) 
        @tier = Tier.new
        @tier.cake = @cake
        #  binding.pry
    end

    def create
        @tier = current_customer.tiers.build(tier_params)
        if @tier.save 
        @cake = @tier.cake       
        redirect_to tier_path(@tier)
        else
            render 'new'
       end
     end
     def show
        @tier = Tier.find(params[:id])
               
     end
   
     def edit
         @tier = Tier.find_by(params[:id])
     end
    def update
         tier = Tier.find(params[:id])
         tier.update(tier_params)
         render tiers_path(tier)
     end
    def destroy
        @tier.destroy
        redirect_to customer_cakes_path(customer_id: [current_customer.id])
    end


    private

    def tier_params
       
        params.require(:tier).permit(:flavor, :filling, :frosting, :size, :shape, :instructions, :cake_id)
    end
    # def set_cake
    #     @cake = Cake.find(params[:cake_id])
    # end
    
    def set_customer
        @customer = Customer.find(current_customer.id)
    end
end