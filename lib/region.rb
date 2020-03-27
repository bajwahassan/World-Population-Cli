class Region

  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end


class Asia
  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end


class Africa
  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end


class Europe
  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end

class LatinAmericaAndCaribbean
  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end


class Oceania
  attr_accessor :rank, :name, :population, :yearly_change, :net_change, :density,
  :land_area, :migrants_net, :fertility_rate, :median_age, :urban_population,
  :world_share, :all
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

    @@all << self
  end

  def self.all
    @@all
  end
end
