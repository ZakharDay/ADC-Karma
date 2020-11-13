class Api::ServicesController < ApplicationController
  def index
    services = Service.all.collect
    services_data = []

    services.each do |service|
      service_data = service.as_json_for_main_page
      service_data[:url] = api_service_url(service)
      services_data << service_data
    end

    render json: services_data
  end

  def show
    service = Service.find(params[:id])
    service_data = service.as_json_for_main_page
    service_data[:url] = api_service_url(service)

    render json: service_data
  end
end
