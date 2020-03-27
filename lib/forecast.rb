class Forecast
  attr_accessor :year, :world_population, :yearly_change, :net_change, :density,
  :urban_population, :urban_population_percent, :all
  @@all = []

  def initialize(year, world_population, yearly_change, net_change, density,
    urban_population, urban_population_percent)

    @year = year
    @world_population = world_population
    @yearly_change = yearly_change
    @net_change = net_change
    @density = density
    @urban_population = urban_population
    @urban_population_percent = urban_population_percent
    @@all << self
  end

  def self.all
    @@all
  end

end
