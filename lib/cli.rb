class Cli

  @@program = nil
  def program
    while @@program != "exit"
      Cli.new.run
    end
  end

  def run
    puts "***********************************"
    puts "Welcome To World Population Trends!"
    puts "***********************************"
    puts "Type 'exit' to quit the program\n\n"

    puts "1. Information on top 20 countries"
    puts "2. Historical Trends"
    puts "3. Population Forecast"
    puts "4. Population By Region"
    puts "5. population By Religion\n\n"

    print "please choose an option(1 - 5) to get more information: "
    input = gets.chomp
    puts"__________________________________________________________________"
    get_data(input)
  end

  def get_data(choice)
    if choice == "1"
      self.fetch_countries
    elsif choice == "2"
      self.fetch_trends
    elsif choice == "3"
      self.fetch_forecast
    elsif choice == "4"
      self.fetch_regions
    elsif choice == "5"
      puts "Note: This Data is According to a study (based on the 2010 world population of 6.9 billion) by The Pew Forum"
      self.fetch_religions
    elsif choice == "exit"
      @@program = "exit"
    else
      puts "PLEASE CHOOSE A VALID OPTION."
      self.run
    end
  end

  #choice 1 =>
  def fetch_countries   #choice 1 main menu
    Scraper.new.get_countries
    counter = 0
    while counter < 20        #sub-menu
      all_countries = Country.all
      all_countries[counter]
      rank = all_countries[counter].rank
      name = all_countries[counter].name
      puts "#{rank}. #{name}."
      counter += 1
    end
    puts""

    print "Please choose a country to get more information: "
    input = gets.chomp
    puts"__________________________________________________________________"
    fetch_country(input)
  end

  def fetch_country(input)
    if input.to_i.between?(1, 20)
      info = Country.all[input.strip.to_i - 1]
      self.display_country_region(info)
      Country.all.clear
    elsif input == "exit"
      @@program = "exit"
    else
      puts "PLEASE CHOOSE A VALID OPTION."
      Country.all.clear
      self.fetch_countries
    end
  end

  #=>helper method choice 1 & 4
  def display_country_region(data)
    puts "Name: " + data.name
    puts "Rank: " + data.rank
    puts "Population: " + data.population
    puts "Yearly Change: " + data.yearly_change
    puts "Net Change: " + data.net_change
    puts "Density : " + data.density
    puts "Land Area: " + data.land_area
    if data.migrants_net != "" || data.migrants_net != "N.A."
      puts "migrants_net: " + data.migrants_net
    end
    if data.fertility_rate != "" || data.fertility_rate != "N.A."
      puts "Fertility Rate: " + data.fertility_rate
    end
    if data.median_age != "" || data.median_age != "N.A."
      puts "Median Age: " + data.median_age
    end
    if data.urban_population != "" || data.urban_population != "N.A."
      puts "Urban Population: " + data.urban_population
    end
    puts "World Share: " + data.world_share
    puts"__________________________________________________________________"
  end
  #
  #choice 2 =>
  def fetch_trends

    puts "1. 2000 - 2020"
    puts "2. 1980 - 2000"
    puts "3. 1960 - 1980"
    puts "4. 1951 - 1960"
    print "Please choose from above years: "

    Scraper.new.get_historical_trends
    input = gets.chomp
    puts"__________________________________________________________________"
    fetch_trend_years(input)
  end

  def fetch_trend_years(choice)
    if choice == "1"
      first_year = 2000
      last_year = 2020
      fetch_trend_data(first_year,last_year)
    elsif choice == "2"
      first_year = 1980
      last_year = 2000
      fetch_trend_data(first_year,last_year)
    elsif choice == "3"
      first_year = 1960
      last_year = 1980
      fetch_trend_data(first_year,last_year)
    elsif choice == "4"
      first_year = 1951
      last_year = 1960
      fetch_trend_data(first_year,last_year)
    elsif choice == "exit"
      @@program = "exit"
    else
      puts"please choose a valid option."
      HistoricalTrends.all.clear
      self.fetch_trends
    end
  end

  def fetch_trend_data(first_year, last_year)
    HistoricalTrends.all.each do |trend|
      year = trend.year.strip.to_i
      if year.between?(first_year, last_year)
        self.display_trend_forecast(trend)
      end
    end
    HistoricalTrends.all.clear
  end

  #helper method choice 2 & 3
  def display_trend_forecast(data)
    puts "Year: " + data.year
    puts "World Population: " + data.world_population
    puts "Yearly Change: " + data.yearly_change
    puts "Net Change: " + data.net_change
    puts "Density: " + data.density
    puts "Urban Population: " + data.urban_population
    puts "Urban Population Percent: " + data.urban_population_percent
    puts"__________________________________________________________________"
  end
  #
  #choice 3 =>
  def fetch_forecast
    puts "1. 2020 - 2030"
    puts "2. 2030 - 2040"
    puts "3. 2040 - 2050"
    print "Please choose from above years: "

    Scraper.new.get_forecast
    input = gets.chomp
    puts"__________________________________________________________________"
    fetch_forcast_years(input)
  end

  def fetch_forcast_years(choice)
    if choice == "1"
      first_year = 2020
      last_year = 2030
      fetch_forecast_data(first_year, last_year)
    elsif choice == "2"
      first_year = 2030
      last_year = 2040
      fetch_forecast_data(first_year, last_year)
    elsif choice == "3"
      first_year = 2040
      last_year = 2050
      fetch_forecast_data(first_year, last_year)
    elsif choice == "exit"
      @@program = "exit"
    else
      puts"PLEASE CHOOSE A VALID OPTION."
      Forecast.all.clear
      self.fetch_forecast
    end
  end

  def fetch_forecast_data(first_year, last_year)
    Forecast.all.each do |prediction|
      year = prediction.year
      if year.between?(first_year.to_s, last_year.to_s)
        self.display_trend_forecast(prediction)    #line 139
      end
    end
    Forecast.all.clear
  end

  #choice 4 =>
  def fetch_regions
    puts "1. Asia"
    puts "2. Africa"
    puts "3. Europe"
    puts "4. Latin America and the Caribbean"
    puts "5. Northern America"
    puts "6. Oceania"
    puts "7. All Regions"

    print "Please choose a region to get more information: "
    input = gets.chomp
    puts"__________________________________________________________________"
    fetch_region(input)
  end

  def fetch_region(choice)
    if choice == "1"
      Scraper.new.asia
      region_class = "Asia"
      fetch_sub_region(region_class)

    elsif choice == "2"
      Scraper.new.africa
      region_class = "Africa"
      fetch_sub_region(region_class)

    elsif choice == "3"
      Scraper.new.europe
      region_class = "Europe"
      fetch_sub_region(region_class)

    elsif choice == "4"
      Scraper.new.latin_america_and_caribbean
      region_class = "LatinAmericaAndCaribbean"
      fetch_sub_region(region_class)

    elsif choice == "5"
      Scraper.new.get_countries
      Country.all.each do |country|
        if country.name == "U.S.A" || country.name == "Canada" || country.name == "Bermuda" ||
          country.name == "Greenland" || country.name == "Saint Pierre & Miquelon"
          self.display_country_region(country)
          puts"__________________________________________________________________"
        end
      end
      Country.all.clear

    elsif choice == "6"
      Scraper.new.oceania
      region_class = "Oceania"
      fetch_sub_region(region_class)

    elsif choice == "7"
      Scraper.new.get_regions
      region_class = "Region"
      fetch_sub_region(region_class)

    elsif choice == "exit"
      @@program = "exit"

    else
      puts "PLEASE CHOOSE A VALID OPTION."
      self.fetch_regions
    end
  end

  def fetch_sub_region(region_class)
    klass = Object.const_get(region_class)
      klass.all.each do |sub_region|
      self.display_country_region(sub_region)
      puts"__________________________________________________________________"
    end
    Country.all.clear
    klass.all.clear
  end

  #choice 5
  def fetch_religions
    puts "1. Christians"
    puts "2. Muslims"
    puts "3. Atheists"
    puts "4. Hindus"
    puts "5. Buddhists"
    puts "6. Folk Religionists"
    puts "7. Other Religions"
    puts "8. Jews"
    print "Please choose a religion category: "

    input = gets.chomp
    puts "__________________________________________________________________"

    if input.to_i.between?(1, 8)
      puts "1. " + Scraper.new.religion[input.to_i - 1].squeeze
      puts "__________________________________________________________________"
    elsif input == "exit"
      @@program = "exit"
    else
      puts "PLEASE CHOOSE A VALID OPTION."
      self.fetch_religions
    end
  end

end
