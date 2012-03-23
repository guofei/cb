class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  skip_before_filter :authenticate_user!, :only => ['index','show']

  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @commodities = @category.commodities.order("created_at desc")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
