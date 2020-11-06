class Api::ServicesController < ApplicationController
  def index
    render json: Service.all.collect { |service| service.as_json_for_main_page }
  end

  def show
    render json: Service.find(params[:id]).as_json_for_main_page
  end
end
