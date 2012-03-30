class Admins::PopularsController < ApplicationController
  # GET /populars
  # GET /populars.json
  skip_before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admins/admins'

  def index
    @populars = Popular.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @populars }
    end
  end

  # GET /populars/1
  # GET /populars/1.json
  def show
    @popular = Popular.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @popular }
    end
  end

  # GET /populars/new
  # GET /populars/new.json
  def new
    @popular = Popular.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @popular }
    end
  end

  # GET /populars/1/edit
  def edit
    @popular = Popular.find(params[:id])
  end

  # POST /populars
  # POST /populars.json
  def create
    @popular = Popular.new(params[:popular])

    respond_to do |format|
      if @popular.save
        format.html { redirect_to [:admins, @popular], notice: 'Popular was successfully created.' }
        format.json { render json: @popular, status: :created, location: @popular }
      else
        format.html { render action: "new" }
        format.json { render json: @popular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /populars/1
  # PUT /populars/1.json
  def update
    @popular = Popular.find(params[:id])

    respond_to do |format|
      if @popular.update_attributes(params[:popular])
        format.html { redirect_to [:admins, @popular], notice: 'Popular was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @popular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /populars/1
  # DELETE /populars/1.json
  def destroy
    @popular = Popular.find(params[:id])
    @popular.destroy

    respond_to do |format|
      format.html { redirect_to admins_populars_url }
      format.json { head :no_content }
    end
  end
end
