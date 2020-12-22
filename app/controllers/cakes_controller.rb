class CakesController < ApplicationController
    before_action :set_cake, only: [:show, :edit, :update]


    def index
        cake_id = Cake.find_by(params[:id])
        tier_id = Tier.find_by(params[:id])
        @cakes = current_customer.cakes.recent_create
    end

    def new
        @cake = Cake.new

    end

    def create
        @cake = Cake.create(cake_params)
        if @cake.save
               
         redirect_to new_cake_tier_path(@cake)
        else 
         render 'new'
        end
      end
     def show
         @cake = Cake.find_by(id: params[:id])
     end
     
     def edit
        @cake = Cake.find_by(id: params[:cake_id])
        @tier = Tier.find_by(id: params[:id])

         
     end
 
     def update
             
        @cake = Cake.find_by(id: params[:id])
        @tier = Tier.find_by(id: params[:id])
         if cake.update(cake_params)
         redirect_to cake_path(@cake)
         else
         render edit_cake_path(@cake)
         end
     end
 
     def destroy
        Cake.find(params[:id]).destroy
         redirect_to customer_cakes_path(customer_id: [current_customer.id])
     end

     private
    def set_cake
        @cake = Cake.find(params[:id])
    end

    def cake_params
        params.require(:cake).permit(:style, tiers_attributes: [:flavor, :filling, :frosting, :size, :shape, :instructions, :cake_id, :customer_id])
    end
end
