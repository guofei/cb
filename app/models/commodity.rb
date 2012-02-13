class Commodity < ActiveRecord::Base
  has_many :commodity_cates
  has_many :categories, :through => :commodity_cates

  has_many :orders
  has_many :comments

  belongs_to :user
end
