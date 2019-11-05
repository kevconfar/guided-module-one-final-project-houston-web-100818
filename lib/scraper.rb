require 'nokogiri'
require 'open-uri'
require 'byebug'
require_relative '../config/environment'

def hrefs 
    html = open("https://www.hauntedrooms.com/haunted-places")
    doc = Nokogiri::HTML(html)

    return doc.css('div.entry-content li a').map { |link| link['href'] }
end

def href_arr # creates an array of urls that will be plugged into the other methods
    arr = []
    hrefs.each do |state|
        str = "https://www.hauntedrooms.com"
        str += "#{state}"
        arr << str
    end
    arr
end

def state_name(state_href) # gets state name

  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  state = doc.css(".entry-title").text.split(" ").last
end

def haunt_info(state_href) # creates an array for each haunt with subarrays for its name and city
  haunt_names = []

    href = "#{state_href}"

    html = open("#{href}")
    doc = Nokogiri::HTML(html)

    places = doc.css(".section-title-main")

    places.each do |index|
      arr = []
      haunt = index.text[3..-1]
      haunt_names << haunt.split(", ")
    end
  # end
  haunt_names[0..-2]
end

def descriptions(state_href) # creates an array of descriptions (each description is 1 index)

  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  unparsed_info = doc.css(".page-inner p")

  paragraph = ""
  x = unparsed_info[3..-1]
  x.each do |index|
      description = index.text
      if !description.empty?
          paragraph << description
      else
          paragraph << "*"
      end
  end

  h_description = paragraph.split("*")
  last = h_description.pop.split(".")
  h_description += [last[0..-2].join(".")]
  h_description
end

def haunt_hasher(state_href) # creates a hash of every haunt in a state

  haunt_hash = {}
  # href_arr.each do |state_href|

    haunt_hash = {}
    href = "#{state_href}"

    info = haunt_info(href)
    state = state_name(href)
    about = descriptions(href)
    
    # x = 0
    
    info.each do |haunt|
      # about.each do |describe|
          if haunt.length == 3
            if !haunt_hash[state]
                haunt_hash[state] = [{ :name => haunt[0], :city => haunt[1], :state => haunt[2], :description => about[info.index(haunt)] }]
              # end
            else
              # haunt.each do |name, city, state_name|
                haunt_hash[state] << { :name => haunt[0], :city => haunt[1], :state => haunt[2], :description => about[info.index(haunt)] }
              # end
            end
          else
            if !haunt_hash[state]
              # haunt.each do |name, city|
                haunt_hash[state] = [{ :name => haunt[0], :city => haunt[1], :state => state, :description => about[info.index(haunt)] }]
              # end
            else
              # haunt.each do |name, city|
                haunt_hash[state] << { :name => haunt[0], :city => haunt[1], :state => state, :description => about[info.index(haunt)] }
              # end
            end
          end
          # x += 1
        # end
      # end
    end
  # end
  haunt_hash
end


def final_haunt_hash # creates a hash of every state and their haunts
  
  hash = {}

  href_arr.each do |state_href|
    href = "#{state_href}"

    merger = haunt_hasher(href)
    
    hash.merge!(merger)
  end

  hash
end

puts final_haunt_hash["Texas"]
  

# final_haunt_hash.each do | state |
  # state.each do |hauntings|
  #   name: hauntings["name"],
  #   description: hauntings["description"],
  #   city: hauntings["city"],



  # this_bar = Bar.find_or_create_by(
  #   name: bar["name"],
  #   category: bar["categories"][0]["title"],
  #   city: bar["location"]["city"],
  #   url: "https://www.yelp.com/biz/#{bar["alias"]}"
  # )