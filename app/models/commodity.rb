class Commodity < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :commodity_cates
  has_many :categories, :through => :commodity_cates

  has_many :orders
  has_many :comments

  belongs_to :user
end
