require 'httparty'

class WeatherController < ApplicationController  
  def fetch_data
    city = params[:city]
    country = params[:country]
    url = "https://api.weatherbit.io/v2.0/forecast/daily?key=80d66ddb69604aab9719f91319545632&city=#{city}&country=#{country}"
    response = HTTParty.get(url)
    if response.success?
      render json: response
    else
      render json: { error: 'Request failed' }
    end    
  end
end
