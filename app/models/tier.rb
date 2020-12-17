class Tier < ApplicationRecord
    belongs_to :cake
    belongs_to :customer
    # def tiers_attributes(params)
     
    # end
    scope :recent_create, { order_by('created_at DESC')}
    scope :recent_use, { order_by('updated_at DESC')}
end
