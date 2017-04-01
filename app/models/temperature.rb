require "net/http"
require "json"

class Temperature
  attr_reader :temperature

  def initialize(geolocation)
    @temp_data = get_temperature
    @geolocation = geolocation
  end

  def humidity
    @temp_data["currently"]["humidity"]
  end

  def actual_temperature
    @temp_data["currently"]["temperature"]
  end

  def daily_temp(day)
    @temp_data["daily"]["data"][day]["icon"]
  end

  def day(day)
    weekday = @temp_data["daily"]["data"][day]["time"]
    Time.at(weekday)
  end

  def get_temperature
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    key = ENV["WEATHER_KEY"]
    URI("https://api.darksky.net/forecast/#{key}/#{@geolocation}")
  end

end
