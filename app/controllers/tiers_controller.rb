class TiersController < ApplicationController
    before_action :set_cake, only: [:index, :new, :create]
    before_action :set_customer
    
    
    def index
        @cake = Cake.find(params[:cake_id])
        @tiers = @cake.tiers
    end
    def new     
        @tier = Tier.new(cake_id: @cake.id, )        
        @cake.number_tiers.times {@cake.tiers.build}    
    end
    def create
        binding.pry
        @cake = Cake.find_by(id: params[:cake_id])
        
        @tier = Tier.create(tier_params)
        if @tier.save
        redirect_to 'cakes/show'
        else
            render 'new'
       end
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

    
    def set_cake
        @cake = Cake.find(params[:cake_id])
    end
    
    def set_customer
        @customer = Customer.find(current_customer.id)
    end
end