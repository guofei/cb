class HomeController < ApplicationController
  before_filter :check_profile
  skip_before_filter :authenticate_user!
  def index
    @categories = Category.all
    @commodities = Commodity.all
    @schools = School.all
    new_school =  School.new(:id => 0, :name => "All")
    new_school.id = 0
    @schools << new_school
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commodities }
    end
  end

  def search
    @categories = Category.all
    @schools = School.all
    new_school =  School.new(:id => 0, :name => "All")
    new_school.id = 0
    @schools << new_school
    keyword = params[:keyword]
    if keyword == '' or keyword == nil
      return @result
    end

    if params[:school] != '0'
      school = School.find(params[:school])
      user_ids = school.users.map!{|i| i.id}
      @result = Commodity.where('name like ? AND num > ?', "%#{keyword}%", 0).where(:user_id => user_ids)
    else
      @result = Commodity.where('name like ? AND num > ?', "%#{keyword}%", 0)
    end

  end
end
