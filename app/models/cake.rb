class Cake < ApplicationRecord
    has_many :tiers, dependent: :destroy
    has_many :customers, through: :tiers
    accepts_nested_attributes_for :tiers
   

    scope :recent_create, -> { order('created_at DESC') }
    scope :recent_use, -> { order('updated_at DESC') }
    scope :style -> (style) { where(style: style) }

    # scope :flavor, -> (flavor) {where{tier.flavor.id == flavor}}
    

end
