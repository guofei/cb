class Category < ActiveRecord::Base
  has_many :commodity_cates
  has_many :commodities, :through => :commodity_cates
end
