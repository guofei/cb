class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  private
  def check_profile
    if user_signed_in?
      redirect_to :new_profile if !current_user.profile
    end
  end
end
