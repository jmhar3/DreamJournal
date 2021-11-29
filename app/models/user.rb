class User < ApplicationRecord
    # mount_uploader :image, ImageUploader

    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    has_many :transactions
    has_many :goals
    has_many :notes
    has_many :categories

    # def self.find_or_create_by_omniauth(auth)
    #   oauth_email = auth["info"]["email"] || auth["info"]["nickname"] || auth["info"]["name"]
    #   self.where(:email => oauth_email).first_or_create do |user|
    #     user.password = SecureRandom.hex
    #   end
    # end
end