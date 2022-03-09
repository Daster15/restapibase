class NetworksController < ApplicationController
  before_action :analytics_network_params, only: [:create]


  def index
    scope = Network.all
    filters = Networks::IndexFilter.new.call(scope, params)
    
    render json: filters
  end


  def create   
     NetworkCreateJob.perform_later(analytics_network_params.to_h) 
     head :no_content
  end

  private

    def analytics_network_params
      analytics_network_params ||= params.permit(:ssid ,:rssi, :event_name, :mac_address ,:location)
    end

end
