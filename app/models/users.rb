class User < ActiveRecord::Base
  has_many :destinations
  has_secure_password
  has_many :attractions, through: :destinations
  has_many :category
end
