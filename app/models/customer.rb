class Customer < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    has_secure_password
    has_many :tiers
    has_many :cakes, through: :tiers
    def self.from_omniauth(auth)
       where(email: auth.info.email).first_or_initialize do |customer|
          customer.username = auth.info.name
          customer.email = auth.info.email
          customer.password = SecureRandom.hex
        end
    end
end
