require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative "./scraper.rb"
require_relative "./country.rb"
require_relative "./trends.rb"
class Cli



  def run
    puts "***********************************"
    puts "Welcome To World Population Trends!"
    puts "***********************************\n"

    puts "1. Information on top 20 countries"
    puts "2. Current stats"
    puts "3. Historical trends"
    puts "4. Population Forcast"
    puts "5. Population by region"
    puts "6. population by religion"
    puts "please choose an option(1 - 6) to get more information:"


    input = gets.strip.to_i
    puts"__________________________________________________________________"
    puts get_data(input)

  end



  def get_data(choice)
    if choice == 1
      self.countries
    end

  end

  def countries   #choice 1 main menu
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
    puts "Please choose a country to get more information"
    input = gets.strip.to_i
    puts"__________________________________________________________________"
    get_information(input)
  end

  def get_information(input)
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


end
Cli.new.run
