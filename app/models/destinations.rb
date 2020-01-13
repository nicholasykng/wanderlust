class Destination < ActiveRecord::Base
  belongs_to :user
  has_many :attractions
end
