require 'Nokogiri'
require 'Open_uri'

class Scraper

    html = open("https://www.cntraveler.com/gallery/most-haunted-places-in-the-world")
    doc = Nokogiri::HTML(html)


end