class Customer < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    has_secure_password
    has_many :tiers
    has_many :cakes, through: :tiers
    
end
