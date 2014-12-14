#require 'nokogiri'
require 'open-uri'


class WeatherScraper

	def initialize
		html = open("http://www.accuweather.com/en/us/new-york-ny/10017/weather-forecast/349727")
		@nokogiri = Nokogiri::HTML(html)
	end

	# def temp
	# 	@temp = @nokogiri.css('#feed-main div.info .temp').text
	# 	"It is currently #{@temp} and #{@condition}."
	# end

	def condition
	 	@condition = @nokogiri.css('#feed-main div.info .cond').text
	end

	def temp
		@temp = @nokogiri.css('#feed-main div.info .temp').text
		"It is currently #{@temp} and #{@condition}."
	end

	def temp_hi
	 	@temp_hi = @nokogiri.css('strong.temp')[1].text
	 	"Today's Hi: #{@temp_hi}"
	end

	def temp_lo
		puts @nokogiri
	 	@temp_lo = @nokogiri.css('span.low')
	 	puts @temp_lo
	 	"Today's Lo: #{@temp_lo}" 
	end

end 
