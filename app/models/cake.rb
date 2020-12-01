class Cake < ApplicationRecord
    has_many :tiers
    has_many :customers, through: :tiers
    accepts_nested_attributes_for :tiers
end
