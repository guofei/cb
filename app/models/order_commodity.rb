class OrderCommodity < ActiveRecord::Base
  belongs_to :order
  belongs_to :commodity
end
