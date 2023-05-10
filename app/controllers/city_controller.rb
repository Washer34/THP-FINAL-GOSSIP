class CityController < ApplicationController
  def show
    @current_city = City.find(params[:id].to_i)
    @gossips = @current_city.gossips
  end
end
