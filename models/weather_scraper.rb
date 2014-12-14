#require 'nokogiri'
require 'open-uri'


class WeatherScraper

	def initialize
		html = open("http://www.accuweather.com/en/us/new-york-ny/10017/weather-forecast/349727")
		html1 = open("http://www.thefuckingweather.com/?where=10001")
		@nokogiri = Nokogiri::HTML(html)
		@nokogiri1 = Nokogiri::HTML(html1)
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
		"#{@temp} and #{@condition}"
	end

	def temp_hi
	 	@temp_hi = @nokogiri.css('strong.temp')[1].text
	 	"#{@temp_hi}"
	end

	def temp_lo
	 	@temp_lo = @nokogiri1.css('.lowRow td')[0].text
	 	"#{@temp_lo}˚"
	end

end 
