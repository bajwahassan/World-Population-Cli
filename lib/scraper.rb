class Scraper

  def get_countries
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-country/"))
    countries_with_data = html.css("tbody tr")

    countries_with_data.each do |country|
    klass = Object.const_get("Country")
    self.parse(country, klass)
    end
  end

  def parse(data,klass)
    @rank = data.css("td")[0].text.strip
    @name = data.css("td")[1].text.strip
    @population = data.css("td")[2].text.strip
    @yearly_change = data.css("td")[3].text.strip
    @net_change = data.css("td")[4].text.strip
    @density = data.css("td")[5].text.strip
    @land_area = data.css("td")[6].text.strip
    @migrants_net = data.css("td")[7].text.strip
    @fertility_rate = data.css("td")[8].text.strip
    @median_age = data.css("td")[9].text.strip
    @urban_population = data.css("td")[10].text.strip
    @world_share = data.css("td")[11].text.strip


    klass.new(@rank, @name, @population, @yearly_change, @net_change, @density,
      @land_area, @migrants_net, @fertility_rate, @median_age, @urban_population, @world_share)
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

      klass = Object.const_get("Region")
      self.parse(region, klass)
      counter += 1
    end
  end

  def asia
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-asia-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 5
      region = regions[counter]

      klass = Object.const_get("Asia")
      self.parse(region, klass)
      counter += 1
    end
  end

  def africa
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-africa-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 5
      region = regions[counter]

      klass = Object.const_get("Africa")
      self.parse(region, klass)
      counter += 1
    end
  end

  def europe
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-europe-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 4
      region = regions[counter]

      klass = Object.const_get("Europe")
      self.parse(region, klass)
      counter += 1
    end
  end

  def latin_america_and_caribbean
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-latin-america-and-the-caribbean-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 3
      region = regions[counter]

      klass = Object.const_get("LatinAmericaAndCaribbean")
      self.parse(region, klass)
      counter += 1
    end
  end

  def oceania
    html = Nokogiri::HTML(open("https://www.worldometers.info/world-population/population-by-oceania-subregion/"))
    regions = html.css("tbody tr")

    counter = 0
    while counter < 3
      region = regions[counter]

      klass = Object.const_get("Oceania")
      self.parse(region, klass)
      counter += 1
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
