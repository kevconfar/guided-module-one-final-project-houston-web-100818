require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.hauntedrooms.com/haunted-places"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    haunted_states = parsed_page.css('div.entry-content li a')
    haunted_states.each do |state|
        state = {
            name: haunted_states.css["title"].text,
            url: "https://www.hauntedrooms.com/haunted-places" + haunted_states.css('a')[0].attributes["href"].value
        }
    end
byebug
end

scraper