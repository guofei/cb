class MypageController < ApplicationController
  def index
    @new_commodities = current_user.commodities

    @new_orders = current_user.orders
  end
end
