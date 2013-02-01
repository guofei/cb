#! ruby -Ku
# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :check_profile
  skip_before_filter :authenticate_user!
  def index
    @populars = Popular.joins(:commodity).where("commodities.num > ?", 0).order("created_at desc").limit(5)
    @categories = Category.all
    @schools = School.all
    @new = Commodity.order("created_at desc").limit(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commodities }
    end
  end

  def search
    keyword = params[:keyword]

    if keyword == '' or keyword == nil
      return @result
    end

    keywords = keyword.gsub(/　/," ").gsub(/,/," ").gsub(/\v/," ").split(nil)

    if params[:school] != '0'
      school = School.find(params[:school])
      user_ids = school.users.map!{|i| i.id}
      @result = Commodity.search(keywords).where(:user_id => user_ids).order("created_at desc").page(params[:page]).per(15)
    else
      @result = Commodity.search(keywords).order("created_at desc").page(params[:page]).per(15)
    end
  end
end
