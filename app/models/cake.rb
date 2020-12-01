class Cake < ApplicationRecord
    has_many :tiers
    has_many :customers, through: :tiers
end
