require_relative "../lib/concerns/forecast_trends.rb"
class Forecast
  include ForecastAndTrends::InstanceMethods

  def self.all
    @@all
  end

end
