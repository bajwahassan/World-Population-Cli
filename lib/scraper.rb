require_relative "./country.rb"

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

  def method_name

  end


end
Scraper.new.get_countries
