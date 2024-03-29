# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  helper_method :all_schools, :all_categories

  private
  def check_profile
    if user_signed_in?
      redirect_to :new_profile if !current_user.profile
      if current_user.profile
        redirect_to edit_profile_path(current_user.profile) if !current_user.profile.mail or !current_user.school
      end
    end
  end

  def all_categories
    categories = Category.all
  end

  def all_schools
    schools = School.all
    new_school =  School.new(:id => 0, :name => "全ての学校")
    new_school.id = 0
    schools << new_school
  end
end
