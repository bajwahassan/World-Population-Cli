require_relative "./country.rb"
require_relative "./trends.rb"
require_relative "./forecast.rb"
require_relative "./region.rb"
require "pry"
require "nokogiri"
require "open-uri"

class Scraper



  def get_countries
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-country/"))
    countries_with_data = html.css("tbody tr")

    countries_with_data.each do |country|
      @rank = country.css("td")[0].text.strip
      @name = country.css("td")[1].text.strip
      @population = country.css("td")[2].text.strip
      @yearly_change = country.css("td")[3].text.strip
      @net_change = country.css("td")[4].text.strip
      @density = country.css("td")[5].text.strip
      @land_area = country.css("td")[6].text.strip
      @migrants_net = country.css("td")[7].text.strip
      @fertility_rate = country.css("td")[8].text.strip
      @median_age = country.css("td")[9].text.strip
      @urban_population = country.css("td")[10].text.strip
      @world_share = country.css("td")[11].text.strip


      Country.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population, @world_share)
    end
  end


  def get_historical_trends
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/world-population-by-year/"))
    all_years = html.css("tbody tr")

    all_years.each do |year|
      @year = year.css("td")[0].text.strip
      @world_population = year.css("td")[1].text.strip
      @yearly_change = year.css("td")[2].text.strip
      @net_change =year.css("td")[3].text.strip
      @density = year.css("td")[4].text.strip
      @urban_population = year.css("td")[5].text.strip
      @urban_population_percent = year.css("td")[6].text.strip

      HistoricalTrends.new(@year, @world_population, @yearly_change, @net_change,
        @density, @urban_population, @urban_population_percent)
    end
  end


  def get_forecast
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/world-population-projections/"))
    all_years = html.css("tbody tr")

    all_years.each do |year|
      @year = year.css("td")[0].text.strip
      @world_population = year.css("td")[1].text.strip
      @yearly_change = year.css("td")[2].text.strip
      @net_change =year.css("td")[3].text.strip
      @density = year.css("td")[4].text.strip
      @urban_population = year.css("td")[5].text.strip
      @urban_population_percent = year.css("td")[6].text.strip

      Forecast.new(@year, @world_population, @yearly_change, @net_change,
        @density, @urban_population, @urban_population_percent)
    end
  end


  def get_regions
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-region/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 6
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip

      counter += 1

      Region.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population, @world_share)
    end

  end


  def asia
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-asia-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 5
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip

      counter += 1

      Asia.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population, @world_share)
    end

  end


  def africa
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-africa-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 5
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip

      counter += 1

      Africa.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population,
        @world_share)
    end
  end


  def europe
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-europe-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 4
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip


      counter += 1

      Europe.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population,
        @world_share)
    end
  end

  def latin_america_and_caribbean
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-latin-america-and-the-caribbean-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 3
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip

      counter += 1

      LatinAmericaAndCaribbean.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population,
        @world_share)
    end
  end


  def oceania
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-oceania-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 3
      region = regions[counter]
      @rank = region.css("td")[0].text.strip
      @name = region.css("td")[1].text.strip
      @population = region.css("td")[2].text.strip
      @yearly_change = region.css("td")[3].text.strip
      @net_change = region.css("td")[4].text.strip
      @density = region.css("td")[5].text.strip
      @land_area = region.css("td")[6].text.strip
      @migrants_net = region.css("td")[7].text.strip
      @fertility_rate = region.css("td")[8].text.strip
      @median_age = region.css("td")[9].text.strip
      @urban_population = region.css("td")[10].text.strip
      @world_share = region.css("td")[11].text.strip


      counter += 1

      Oceania.new(@rank, @name, @population, @yearly_change, @net_change, @density,
        @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population,
        @world_share)
    end
  end


  def religion
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/"))
    religions = html.css("div.content ul li")
    @array = []
    n = 10
    while n < 18
      @array << religions[n].text.strip
      n += 1
    end
    return @array
  end

end
