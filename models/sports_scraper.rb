require 'nokogiri' 
require 'open-uri'

class Sportsheadlines

  def initialize
    html = open("http://espn.go.com/")
    @nokogiri = Nokogiri::HTML(html)
    @headline_array=[]
    fixed_headlines
    arraymaker
  end

  def fixed_headlines
    @headlines = @nokogiri.css('ul.bulletlinks.blk-links').collect do |name|
      name.text
    end

      @fixed_headlines = @headlines.join(" ").split("   ").select do |headline|
        if headline != ""
          headline.strip
        end
     end
  end

  def arraymaker
    @headline_array=@fixed_headlines[0].split("\n")
  end

  def parts
    @headline_array[10..19]
  end
end
