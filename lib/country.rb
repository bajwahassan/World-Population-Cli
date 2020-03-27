require_relative "../lib/concerns/country_region.rb"
class Country
  include CountryAndRegion::InstanceMethods

  def self.all
    @@all
  end

end
