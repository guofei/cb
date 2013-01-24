class CommoditiesController < ApplicationController
  before_filter :check_profile
  skip_before_filter :authenticate_user!, :only => ['show']

  # GET /commodities
  # GET /commodities.json
  def index
    @categories = Category.all
    @commodities = current_user.commodities.order("created_at desc")
    @selled = @commodities.where(:num => 0).page(params[:page]).per(15)
    @selling = @commodities.where("num > ?", 0).page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commodities }
    end
  end

  # GET /commodities/1
  # GET /commodities/1.json
  def show
    @categories = Category.all
    @commodity = Commodity.find(params[:id])
    @comment = Comment.new
    @comment.commodity = @commodity
    @order = Order.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commodity }
    end
  end

  # GET /commodities/new
  # GET /commodities/new.json
  def new
    @commodity = Commodity.new
    old_commodity = Commodity.find(params[:id]) if params[:id]
    if old_commodity
      @commodity.name = old_commodity.name
      @commodity.desc = old_commodity.desc
      @commodity.price = old_commodity.price
      @category = old_commodity.categories.first
    end
    @category = Category.first if @category == nil

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commodity }
    end
  end

  # GET /commodities/1/edit
  def edit
    @commodity = Commodity.find(params[:id])
    @category = Category.first
  end

  # POST /commodities
  # POST /commodities.json
  def create
    @category = Category.first
    @commodity = Commodity.new(params[:commodity])
    @commodity.user = current_user
    category = Category.find(params[:category])
    debugger
    size = 0
    size = params[:commodity][:photo].size if params[:commodity][:photo]

    respond_to do |format|
      if size > 2000000
        @commodity.errors[:base] << "Photo size should < 2MB"
        format.html { render action: "new" }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      else
        if @commodity.save
          if category
            @commodity.commodity_cates.create(:category => category)
          end

          format.html { redirect_to @commodity, notice: 'Commodity was successfully created.' }
          format.json { render json: @commodity, status: :created, location: @commodity }
        else
          format.html { render action: "new" }
          format.json { render json: @commodity.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /commodities/1
  # PUT /commodities/1.json
  def update
    @category = Category.first
    @commodity = Commodity.find(params[:id])

    size = 0
    size = params[:commodity][:photo].size if params[:commodity][:photo]

    respond_to do |format|
      if size > 2000000
        @commodity.errors[:base] << "Photo size should < 2MB"
        format.html { render action: "new" }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      else
        if @commodity.update_attributes(params[:commodity])
          format.html { redirect_to @commodity, notice: 'Commodity was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @commodity.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /commodities/1
  # DELETE /commodities/1.json
  def destroy
    @commodity = Commodity.find(params[:id])
    @commodity.num = 0

    respond_to do |format|
      if @commodity.save
        format.html { redirect_to commodities_url, notice: 'Commodity was successfully canceled.' }
        format.json { render json: @commodity, status: :created, location: @commodity }
      end
    end
  end
end
