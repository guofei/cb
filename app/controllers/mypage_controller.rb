class MypageController < ApplicationController
  def index
    @new_commodities = current_user.commodities.order("created_at DESC").limit(8)
    @new_orders = current_user.orders.order("created_at DESC").limit(4)
  end
end
