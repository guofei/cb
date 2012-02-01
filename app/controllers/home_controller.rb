class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @commodities = Commodity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commodities }
    end
  end
end
