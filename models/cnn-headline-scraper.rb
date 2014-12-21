require 'nokogiri' 
require 'open-uri'

class Headlinescraper

  def initialize
    html = open("http://www.cnn.com/#us")

    @nokogiri = Nokogiri::HTML(html)
  end

  def fixed_headlines
    @headlines = @nokogiri.css('div#cnn_maintt2bul ul.cnn_bulletbin').collect do |name|
      name.text
    end

     @fixed_headlines = @headlines.join(" ").split("   ").select do |headline|
       if headline != ""
        headline.strip
      end
     end
   @fixed_headlines.first(10)
  end 

end




