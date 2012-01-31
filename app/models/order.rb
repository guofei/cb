class Order < ActiveRecord::Base
  has_many :order_commodities
  has_many :commodities, :through => :order_commodities
end
