class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_commodities
  has_many :commodities, :through => :order_commodities
end
