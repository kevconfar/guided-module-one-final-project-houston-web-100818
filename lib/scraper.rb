require 'nokogiri'
require 'open-uri'
# require_relative '../config/environment'

def hrefs
    html = open("https://www.hauntedrooms.com/haunted-places")
    doc = Nokogiri::HTML(html)

    return doc.css('div.entry-content li a').map { |link| link['href'] }
end

def href_arr # will insert state_href as argument. If done on a loop, perhaps use shift to delete index 0 each time.
    arr = []
    hrefs.each do |state|
        str = "https://www.hauntedrooms.com"
        str += "#{state}"
        arr << str
    end
    arr
end

def state_name(state_href)

  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  state = doc.css(".entry-title").text.split(" ").last
end

def haunt_info(state_href)
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

def descriptions(state_href)

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

def haunt_hasher(state_href)

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


def final_haunt_hash
  
  hash = {}

  href_arr.each do |state_href|
    href = "#{state_href}"

    merger = haunt_hasher(href)
    
    hash.merge!(merger)
  end

  hash
end

puts final_haunt_hash
  
