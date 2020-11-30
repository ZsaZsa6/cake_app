class CakesController < ApplicationController
    before_action :set_cake, only: [:show, :edit, :update, :destroy]


    def index
    @cakes = current_customer.cakes
    cake_id = Cake.find_by(params[:id])
    end
    def new
        @cake = Cake.new(customer_id: [current_customer.id])
    end
    private

    def set_cake
        @cake = Cake.find(params[:id])
    end

    def cake_params
        params.require(:order).permit(:title, :number_tiers, :customer_id)
    end
end
