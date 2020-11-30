class Cake < ApplicationRecord
    belongs_to :customer
    validates_presence_of :customer
    has_many :tiers
    has_many :customers, through: :tiers
end
