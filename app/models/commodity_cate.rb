class CommodityCate < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :category
end
