class CakesController < ApplicationController
    before_action :set_cake, only: [:show, :edit, :update, :destroy]


    def index
    @cakes = current_customer.cakes
    cake_id = Cake.find_by(params[:id])
    end
    def new
        @cake = Cake.new(customer_id: [current_customer.id])
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
         @cake = Cake.find_by(params[:id])
     end
     
     def edit
         @cake = Cake.find_by(params[:id])        
         
     end
 
     def update
         cake = Cake.find(params[:id])
         if cake.update(cake_params)
         render 'cakes_path(cake)'
         end
     end
 
     def destroy
         @cake.destroy
         redirect_to cakes_path
     end

     private
    def set_cake
        @cake = Cake.find(params[:id])
    end

    def cake_params
        params.require(:cake).permit(:title, :number_tiers, :customer_id, tiers_attributes: [:flavor, :filling, :frosting, :size, :shape, :instructions, :cake_id])
    end
end
