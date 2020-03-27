module CountryAndRegion


  module InstanceMethods
    attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
    :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
    :world_share
    @@all = []

    def initialize(rank, name, population, yearly_change, net_change, density, land_area,
      migrants_net, fertility_rate, median_age, urban_population, world_share)

      @rank = rank
      @name = name
      @population = population
      @yearly_change = yearly_change
      @net_change = net_change
      @density = density
      @land_area = land_area
      @migrants_net = migrants_net
      @fertility_rate = fertility_rate
      @median_age = median_age
      @urban_population = urban_population
      @world_share = world_share
      # self.class.all << self
      @@all << self
    end
  end


end
