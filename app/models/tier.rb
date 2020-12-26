class Tier < ApplicationRecord
    belongs_to :cake
    belongs_to :customer
  #more validations?--presence true for size and instructions
    
end
