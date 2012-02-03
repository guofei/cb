class Commodity < ActiveRecord::Base
  has_many :commodity_cates
  has_many :categories, :through => :commodity_cates

  has_many :order_commodities
  has_many :orders, :through => :order_commodities

  has_many :comments

  belongs_to :user
end
