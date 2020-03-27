class HistoricalTrends
  include ForecastAndTrends::InstanceMethods

  def self.all
    @@all
  end

end
