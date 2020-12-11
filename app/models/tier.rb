class Tier < ApplicationRecord
    belongs_to :cake
    belongs_to :customer
    def tiers_attributes(params)
        binding.pry
    end
end
