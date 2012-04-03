class AlertsController < ApplicationController
  before_filter :check_profile
  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = current_user.alerts.order("created_at DESC").page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alerts }
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.json { head :no_content }
    end
  end
end
