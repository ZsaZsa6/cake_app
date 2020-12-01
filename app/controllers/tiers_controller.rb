class TiersController < ApplicationController
    before_action :set_cake, only: [:index, :new, :create]
    
    
    def index
        @cake = Cake.find_by(params[:cake_id])
        @tiers = @cake.tiers
    end
    def new                    
        @tier = Tier.new(cake_id: @cake.id, customer_id: @customer.id)
        @cake.number_tiers.times {@cake.tiers.build}    
    end
    
    def show
        @tier = Tier.find_by(params[:id]) 
     end
     def edit
         @tier = Tier.find_by(params[:id])
     end
     def update
         tier = Tier.find(params[:id])
         tier.update(tier_params)
         render tiers_path(tier)
     end


    private

    def tier_params
        def tier_params
            params.require(:tier).permit(:flavor, :filling, :frosting, :size, :shape, :instructions, :cake_id, :customer_id)
    # def set_customer
    #     @customer = Customer.find(params[:id])
    # end
    # def set_cake
    #     @cake = Cake.find(params[:id])
    # end
    end