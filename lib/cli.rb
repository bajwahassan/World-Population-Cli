require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative "./scraper.rb"
require_relative "./country.rb"
require_relative "./trends.rb"
require_relative "./forecast.rb"
require_relative "./region.rb"



class Cli



  def run
    puts "***********************************"
    puts "Welcome To World Population Trends!"
    puts "***********************************\n"

    puts "1. Information on top 20 countries"
    puts "2. Historical Trends"   #start working on option 2 input
    puts "3. Population Forecast"
    puts "4. Population By Region"
    puts "5. population By Religion"
    print "please choose an option(1 - 5) to get more information: "


    input = gets.strip.to_i
    puts"__________________________________________________________________"
    get_data(input)

  end



  def get_data(choice)
    if choice == 1
      self.fetch_countries
    elsif choice == 2
      self.fetch_trends
    elsif choice == 3
      self.fetch_forecast
    elsif choice == 4
      self.fetch_regions
    elsif choice == 5
      puts "Note: This Data According to a study (based on the 2010 world population of 6.9 billion) by The Pew Forum"
      self.fetch_religions
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
    input = gets.strip.to_i
    puts"__________________________________________________________________"
    fetch_country(input)
  end

  def fetch_country(input)
    info = Country.all[input - 1]

    puts "Name: " + info.name
    puts "Rank: " + info.rank
    puts "Population: " + info.population
    puts "Yearly Change: " + info.yearly_change
    puts "Net Change: " + info.net_change
    puts "Density : " + info.density
    puts "Land Area: " + info.land_area
    if info.migrants_net != "" || info.migrants_ != "N.A."
      puts "migrants_net: " + info.migrants_net
    end
    if info.fertility_rate != "" || info.fertility_rate != "N.A."
      puts "Fertility Rate: " + info.fertility_rate
    end
    if info.median_age != "" || info.median_age != "N.A."
      puts "Median Age: " + info.median_age
    end
    if info.urban_population != "" || info.urban_population != "N.A."
      puts "Urban Population: " + info.urban_population
    end
    puts "World Share: " + info.world_share
  end

  #choice 2 =>
  def fetch_trends

    puts "1. 2000 - 2020"
    puts "2. 1980 - 2000"
    puts "3. 1960 - 1980"
    puts "4. 1951 - 1960"
    print "Please choose from above years: "

    Scraper.new.get_historical_trends
    input = gets.strip.to_i
    puts"__________________________________________________________________"
    fetch_trend_years(input)
  end

  def fetch_trend_years(choice)
    if choice == 1
      first_year = 2000
      last_year = 2020
    elsif choice == 2
      first_year = 1980
      last_year = 2000
    elsif choice == 3
      first_year = 1960
      last_year = 1980
    elsif choice == 4
      first_year = 1951
      last_year = 1960
    end
    fetch_trend_data(first_year,last_year)
  end

  def fetch_trend_data(first_year, last_year)
    HistoricalTrends.all.each do |trend|
      year = trend.year
      if year.between?(first_year.to_s, last_year.to_s)
        puts "Year: " + trend.year
        puts "World Population: " + trend.world_population
        puts "Yearly Change: " + trend.yearly_change
        puts "Net Change: " + trend.net_change
        puts "Density: " + trend.density
        puts "Urban Population: " + trend.urban_population
        puts "Urban Population Percent: " + trend.urban_population_percent
        puts"__________________________________________________________________"
      end
    end
  end

  #choice 3 =>
  def fetch_forecast
    puts "1. 2020 - 2030"
    puts "2. 2030 - 2040"
    puts "3. 2040 - 2050"
    print "Please choose from above years: "

    Scraper.new.get_forecast
    input = gets.strip.to_i
    puts"__________________________________________________________________"
    fetch_forcast_years(input)
  end

  def fetch_forcast_years(choice)
    if choice == 1
      first_year = 2020
      last_year = 2030
    elsif choice == 2
      first_year = 2030
      last_year = 2040
    elsif choice == 3
      first_year = 2040
      last_year = 2050
    end
    fetch_forecast_data(first_year, last_year)
  end

  def fetch_forecast_data(first_year, last_year)
    Forecast.all.each do |prediction|
      year = prediction.year
      if year.between?(first_year.to_s, last_year.to_s)
        puts "Year: " + prediction.year
        puts "World Population: " + prediction.world_population
        puts "Yearly Change: " + prediction.yearly_change
        puts "Net Change: " + prediction.net_change
        puts "Density: " + prediction.density
        puts "Urban Population: " + prediction.urban_population
        puts "Urban Population Percent: " + prediction.urban_population_percent
        puts"__________________________________________________________________"
      end
    end
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
    # Scraper.new.get_regions
    input = gets.strip.to_i
    puts"__________________________________________________________________"
    fetch_region(input)
  end

  def fetch_region(choice)

    if choice == 1
      Scraper.new.asia
      region_class = "Asia"
      fetch_sub_region(region_class)
    elsif choice == 2
      Scraper.new.africa
      region_class = "Africa"
      fetch_sub_region(region_class)
    elsif choice == 3
      Scraper.new.europe
      region_class = "Europe"
      fetch_sub_region(region_class)
    elsif choice == 4
      Scraper.new.latin_america_and_caribbean
      region_class = "LatinAmericaAndCaribbean"
      fetch_sub_region(region_class)
    elsif choice == 5
      Scraper.new.get_countries
      Country.all.each do |country|
        if country.name == "U.S.A" || country.name == "Canada" || country.name == "Bermuda" ||
          country.name == "Greenland" || country.name == "Saint Pierre & Miquelon"
          puts "Name: " + country.name
          puts "Rank: " + country.rank
          puts "Population: " + country.population
          puts "Yearly Change: " + country.yearly_change
          puts "Net Change: " + country.net_change
          puts "Density : " + country.density
          puts "Land Area: " + country.land_area
          puts "migrants_net: " + country.migrants_net
          puts "Fertility Rate: " + country.fertility_rate
          puts "Median Age: " + country.median_age
          puts "Urban Population: " + country.urban_population
          puts"__________________________________________________________________"
        end
      end
    elsif choice == 6
      Scraper.new.oceania
      region_class = "Oceania"
      fetch_sub_region(region_class)
    elsif choice == 7
      Scraper.new.get_regions
      region_class = "Region"
      fetch_sub_region(region_class)
    end
  end

  def fetch_sub_region(region_class)
    klass = Object.const_get(region_class)
      klass.all.each do |sub_region|
      puts "Name: " + sub_region.name
      puts "Rank: " + sub_region.rank
      puts "Population: " + sub_region.population
      puts "Yearly Change: " + sub_region.yearly_change
      puts "Net Change: " + sub_region.net_change
      puts "Density: " + sub_region.density
      puts "Land Area: " + sub_region.land_area
      puts "migrants_net: " + sub_region.migrants_net
      puts "Fertility Rate: " + sub_region.fertility_rate
      puts "Median Age: " + sub_region.median_age
      puts "Urban Population: " + sub_region.urban_population
      puts"__________________________________________________________________"
    end
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
    input = gets.strip.to_i

    puts "__________________________________________________________________"
    puts "1. " + Scraper.new.religion[input - 1]
    puts "__________________________________________________________________"
  end

end
Cli.new.run
