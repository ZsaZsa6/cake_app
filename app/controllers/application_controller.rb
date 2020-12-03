class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_customer, :authorized, :username

    def index
      if logged_in?
        redirect_to customer_path(current_customer)
      else 
        render '/homepage'
     end
    end 
  
    def current_customer
      if session[:customer_id]
      current_customer = Customer.find(session[:customer_id])
         
      end
    end 
    
          
    def logged_in?
      !!current_customer
    end 
      
    def authorize
      if !logged_in?
        redirect_to login_path
      end 
    end 
      
    def authenticate 
      if !current_customer
        redirect_to current_customer
      end 
    end 
   

end
