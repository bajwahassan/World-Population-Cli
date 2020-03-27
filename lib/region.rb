class Region
  include CountryAndRegion::InstanceMethods

  def self.all
    @@all
  end
end


class Asia < Region
  def self.all
    @@all
  end
end


class Africa < Region
  def self.all
    @@all
  end
end


class Europe < Region
  def self.all
    @@all
  end
end


class LatinAmericaAndCaribbean < Region
  def self.all
    @@all
  end
end


class Oceania < Region
  def self.all
    @@all
  end
end
