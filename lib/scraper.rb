require 'nokogiri'
require 'open-uri'

class Scraper

    html = open("https://www.cntraveler.com/gallery/the-most-haunted-places-in-america")
    doc = Nokogiri::HTML(html)

    @h_arr = []
    @haunted_places = doc.css(".hed")[1..-1]

    @haunted_places.each do |index|
        place = index.text
        @h_arr << place
    end


    @info_arr = []
    @haunted_info = doc.css(".dek").css('p')

    @haunted_info.each do |index|
        description = index.inner_text
        @info_arr << description
    end    


    hash = {}
    @h_arr.each do |place|
        haunting = place.split(',')
        if !hash[haunting.last]
            if haunting.length == 3
                hash[haunting.last] = [{ :city => haunting[1], :haunt => haunting[0], :info => @info_arr[@h_arr.index(place)] }]
            else
                hash[haunting.last] = [{ :haunt => haunting[0], :info => @info_arr[@h_arr.index(place)] }]
            end
        else
            if haunting.length == 3
                hash[haunting.last] << { :city => haunting[1], :haunt => haunting[0], :info => @info_arr[@h_arr.index(place)] }
            else
                hash[haunting.last] << { :haunt => haunting[0], :info => @info_arr[@h_arr.index(place)] }
            end
        end
    end

end

