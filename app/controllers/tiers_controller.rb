class TiersController < ApplicationController
    before_action :set_cake, only: [:index, :new, :create]
    before_action :set_customer
    
    def index
        @cake = Cake.find_by(params[:cake_id])
        @tiers = @cake.tiers
    end
    def new                    
        @tier = Tier.new(cake_id: @cake.id, customer_id: @customer.id)
        @cake.number_tiers.times {@cake.tiers.build}    
    end


    private
    def set_customer
        @customer = Customer.find(params[:id])
    end
    def set_cake
        @cake = Cake.find_by(params[:id])
    end
    end