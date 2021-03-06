class User < ActiveRecord::Base

  include Clearance::User

  has_many :authentications, dependent: :destroy
  has_many :listings, foreign_key: :user_id
  has_many :reservations, dependent: :destroy
  has_many :payments

  searchkick

  mount_uploader :image, ImageUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.image = auth_hash["info"]["image"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = SecureRandom.hex(10)
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
