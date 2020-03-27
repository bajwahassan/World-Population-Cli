require "pry"
require "nokogiri"
require "open-uri"
require "lolize/auto"

require_relative "../lib/concerns/country_region.rb"
require_relative "../lib/concerns/forecast_trends.rb"
require_relative "../lib/country.rb"
require_relative "../lib/trends.rb"
require_relative "../lib/forecast.rb"
require_relative "../lib/region.rb"
require_relative "../lib/scraper.rb"
require_relative "../lib/cli.rb"

Cli.new.program
