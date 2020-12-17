class Cake < ApplicationRecord
    has_many :tiers
    has_many :customers, through: :tiers
    accepts_nested_attributes_for :tiers
    scope :recent_create, { order_by('created_at DESC')}
    scope :recent_use, { order_by('updated_at DESC')}
    
end
