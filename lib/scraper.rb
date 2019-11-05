require 'nokogiri'
require 'open-uri'
# require_relative '../config/environment'


# class Scraper

# html = open("https://www.cntraveler.com/gallery/the-most-haunted-places-in-america")
# doc = Nokogiri::HTML(html)

# attr_reader :haunt_info, :haunt_descr, :haunt_haunt_hash

# def initailize
#     haunt_info = doc.css(".hed")[1..-1]
#     haunt_about = doc.css(".dek").css('p')
# end

# def haunt_description
# haunt_info.each do |index|
#     if place.length == 3
#         h = {
#             haunt: place[0]
#         }
#         location
#     }

# html = open("https://www.cntraveler.com/gallery/the-most-haunted-places-in-america")
# doc = Nokogiri::HTML(html)

# info_arr = []
# haunt_info = doc.css(".hed")[1..-1]

# haunt_info.each do |index|
#     place = index.text
#     info_arr << place
# end


# about_arr = []
# haunt_about = doc.css(".dek").css('p')

# haunt_about.each do |index|
#     description = index.inner_text
#     about_arr << description
# end    

# haunt_hash = {}
# info_arr.each do |place|
#     haunting = place.split(',')
#     if !haunt_hash[haunting.last]
#         if haunting.length == 3
#             haunt_hash[haunting.last] = [{ :city => haunting[1], :haunt => haunting[0], :info => about_arr[info_arr.index(place)] }]
#         else
#             haunt_hash[haunting.last] = [{ :haunt => haunting[0], :info => about_arr[info_arr.index(place)] }]
#         end
#     else
#         if haunting.length == 3
#             haunt_hash[haunting.last] << { :city => haunting[1], :haunt => haunting[0], :info => about_arr[info_arr.index(place)] }
#         else
#             haunt_hash[haunting.last] << { :haunt => haunting[0], :info => about_arr[info_arr.index(place)] }
#         end
#     end
# end



# end

#------------------------------------------------------------------------------------------
#GETS THE HREFS FOR EACH STATE AND INDEXES THEM IN AN ARRAY

# html = open("https://www.hauntedrooms.com/haunted-places")
# doc = Nokogiri::HTML(html)

# urls = doc.css('div.entry-content li a').map { |link| link['href'] }

#------------------------------------------------------------------------------------------
# CREATES AN ARRAY FOR EACH HAUNT AND PLACES IT INSIDE A HAUNT_NAMES ARRAY

# html = open("https://www.hauntedrooms.com/top-8-most-haunted-places-in-alabama")
# doc = Nokogiri::HTML(html)

# places = doc.css(".section-title-main")

# haunt_names = []
# places.each do |index|
#     haunt = index.text[4..-1]
#     arr = [haunt.split(", ")]
#     haunt_names += arr
# end

# puts haunt_names[0][1]


#------------------------------------------------------------------------------------------
#ADDS DESCRIPTION FOR EACH HAUNT TO AN INDEX IN AN ARRAY
# def test_descriptions
#     html = open("https://www.hauntedrooms.com/6-most-haunted-places-in-arkansas")
#     doc = Nokogiri::HTML(html)

#     # l = doc.css("div.page-inner").css("p")
#     l = doc.css(".page-inner p")

#     paragraph = ""
#     x = l[3..-1]
#     x.each do |index|
#         description = index.text
#         if !description.empty?
#             paragraph << description
#         else
#             paragraph << "*"
#         end
#     end

#     descriptions = paragraph.split("*")
#     last = descriptions[-1].split(".")
#     last.pop
#     descriptions.pop
#     descriptions += [last.join(".")]
# end

# puts test_descriptions


#------------------------------------------------------------------------------------------
# GETS STATE NAME

# html = open("https://www.hauntedrooms.com/top-8-most-haunted-places-in-alabama")
# doc = Nokogiri::HTML(html)

# state = doc.css(".entry-title").text.split(" ").last

# puts state

#------------------------------------------------------------------------------------------

# state_html = open("https://www.hauntedrooms.com/haunted-places")
# state_doc = Nokogiri::HTML(state_html)

# urls = state_doc.css('div.entry-content li a').map { |link| link['href'] }

# haunt_hash = {}


# def hrefs
#     html = open("https://www.hauntedrooms.com/haunted-places")
#     doc = Nokogiri::HTML(html)

#     return doc.css('div.entry-content li a').map { |link| link['href'] }
# end

# def href_arr # will insert state_href as argument. If done on a loop, perhaps use shift to delete index 0 each time.
#     arr = []
#     hrefs.each do |state|
#         str = "https://www.hauntedrooms.com"
#         str += "#{state}"
#         arr << str
#     end
#     arr
# end

# def state_name # takes in state href as an argument and pulls up that states name
#   arr = []
#   href_arr.each do |state_href|

#       tester = "#{state_href}"

#       html = open("#{tester}")
#       doc = Nokogiri::HTML(html)

#       state = doc.css(".entry-title").text.split(" ").last
#       arr << state
#     end
#     arr
# end

# def haunt_info
#     haunt_names = []
#     href_arr.each do |state_href|
        
#         href = state_href

#         html = open("#{href}")
#         doc = Nokogiri::HTML(html)

#         places = doc.css(".section-title-main")

#         places.each do |index|
#             haunt = index.text[4..-1]
#             arr = [haunt.split(", ")]
#             haunt_names += arr
#         end
#     end
#     haunt_names
# end

# def descriptions
#     arr = []
#     h_description = []

#     href_arr.each do |state_href|

#       href = "#{state_href}"

#       html = open("#{href}")
#       doc = Nokogiri::HTML(html)

#       unparsed_info = doc.css(".page-inner p")

#       paragraph = ""
#       x = unparsed_info[3..-1]
#       x.each do |index|
#           description = index.text
#           if !description.empty?
#               paragraph << description
#           else
#               paragraph << "*"
#           end
#       end

#       h_description = paragraph.split("*")
#       last = h_description.pop.split(".")
#       h_description += [last[0..-2].join(".")]
#       arr << [h_description]
#     end
#     arr

# end

# puts descriptions 


#     arr = []


#     href_arr.each do |state_href|
        
#         href = state_href

#         html = open("#{state_href}")
#         doc = Nokogiri::HTML(html)

#         unparsed_info = doc.css(".page-inner p")

#         paragraph = ""
#         x = unparsed_info[3..-1]
#         x.each do |index|
#             description = index.text
#             if !description.empty?
#                 paragraph << description
#             else
#                 paragraph << "*"
#             end
#         end

#         descriptions = paragraph.split("*")
#         last = descriptions.pop.split(".")
#         descriptions += last[0..-2]
#         arr << descriptions
#     end
#     arr
# end




# def print_descriptions
#     arr = []
#     href_arr.each do |state_href|
#         tester = descriptions("#{state_href}")
#         arr += tester
#     end
#     arr
# end

# puts print_descriptions
        


# def hash_maker

#     haunt_hash = {}

#     state_name.each do |state|
#         haunt_info.each do |haunt| 
#             descriptions.each do |state_haunts|
#                 state_haunts.each do |index|
#                 if !haunt_hash[state]
#                     haunt_hash[state] = [{ :name => haunt[0], :location => haunt[1], :description => index }]
#                 else
#                     haunt_hash[state] << { :name => haunt[0], :location => haunt[1], :description => index }
#                 end
#             end
#         end
#     end

#     haunt_hash
# end


# puts hash_maker


# puts state_name(href_arr)



# state_name

# def haunt_info #creates an array for each state with sub-arrays for its haunts
  

#         html = open("https://www.hauntedrooms.com/top-8-most-haunted-places-in-alabama")
#         doc = Nokogiri::HTML(html)

#         places = doc.css(".section-title-main")

#         places.each do |index|
#             haunt = index.text[4..-1]
#             sub_arrs = [haunt.split(", ")] #each haunt has two sub-arrays (name and location)
#             arr += sub_arrs
#         end
#         haunt_names_locations += arr
    

#     return haunt_names_locations
# end

# puts haunt_info


# def description
#     descriptions = []

#     hrefs.each do |state|
#         html = open("https://www.hauntedrooms.com#{state}")
#         doc = Nokogiri::HTML(html)

#         unparsed_info = doc.css("div.page-inner").css("p")

#         paragraph = ""
#         x = unparsed_info[3..-1] #changed 25 to -1
#         x.each do |index|
#             description = index.text
#             if !description.empty?
#                 paragraph << description
#             else
#                 paragraph << "*"
#             end
#         end
#         arr = [paragraph.split("*")]
#     end

#     descriptions += arr
# end

# puts haunt_info


# urls.each do |state_href|
#     html = open("https://www.hauntedrooms.com/#{state_href}")
#     doc = Nokogiri::HTML(html)

#     l = doc.css("div.page-inner").css("p")

#     paragraph = ""
#     x = l[3..25]
#     x.each do |index|
#         description = index.text
#         if !description.empty?
#             paragraph << description
#         else
#             paragraph << "*"
#         end
#     end

# descriptions = paragraph.split("*")

#     state = doc.css(".entry-title").text.split(" ").last

#     if !haunt_hash[state]
#         haunt_hash[state] = [{ :name => index[0], :location => index[1], :description => descriptions[haunt_names.index(place)] }]
#     else
#         haunt_hash[state] << { :name => index[0], :location => index[1], :description => descriptions[haunt_names.index(place)] }




# # urls = doc.css('div.entry-content li a').map { |link| link['href'] }

# # state_html =

# hash = {}
# haunt_names.eacn do |place|
#     if !hash[state]
#         hash[state] = [{ :name => index[0], :location => index[1], :description => descriptions[haunt_names.index(place)] }]
#     else
#         hash[state] << { :name => index[0], :location => index[1], :description => descriptions[haunt_names.index(place)] }
#     end
# end


# def hrefs
#     html = open("https://www.hauntedrooms.com/haunted-places")
#     doc = Nokogiri::HTML(html)

#     return doc.css('div.entry-content li a').map { |link| link['href'] }
# end


# def href_arr # will insert state_href as argument. If done on a loop, perhaps use shift to delete index 0 each time.
#     arr = []
#     hrefs.each do |state|
#         str = "https://www.hauntedrooms.com"
#         str += "#{state}"
#         arr << str
#     end
#     arr
# end


# def descriptions(state_href)

#   href = "#{state_href}"

#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   unparsed_info = doc.css(".page-inner p")

#   paragraph = ""
#   x = unparsed_info[3..-1]
#   x.each do |index|
#       description = index.text
#       if !description.empty?
#           paragraph << description
#       else
#           paragraph << "*"
#       end
#   end

#   h_description = paragraph.split("*")
#   last = h_description.pop.split(".")
#   h_description += [last[0..-2].join(".")]
#   h_description
# end

# def haunt_info(state_href)

#   haunt_names = []

#   href = "#{state_href}"

#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   places = doc.css(".section-title-main")

#   places.each do |index|
#       haunt = index.text[4..-1]
#       arr = [haunt.split(", ")]
#       haunt_names << arr
#   end

#   haunt_names
# end

# def state_name(state_href)

#   href = "#{state_href}"
#   arr = []


#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   state = doc.css(".entry-title").text.split(" ").last
#   arr << state
# end


# def description_test
#   tester = []
#   href_arr.each do |state_href|
#     href = "#{state_href}"
#     example = descriptions("#{href}")
#     tester << example
#   end
#   tester
# end

# puts description_test

# def hash_maker
#   haunt_hash = {}

#   href_arr.each do |state_href|
#     haunt_descriptions = descriptions("#{state_href}")
#     info = haunt_info("#{state_href}")
#     state = state_name("#{state_href}")
#     haunt_descriptions.each do |description|
#         x = 0
#         y = 1
#         info.each do |name_loc|
#             if !haunt_hash[state]
#             haunt_hash[state] = [{ :name => name_loc[x], :location => name_loc[y], :description => description }]
#             else
#             haunt_hash[state] << { :name => name_loc[x], :location => name_loc[y], :description => description }
#             end
#             x += 2
#             y += 2
#         end
#     end
#   end
#   haunt_hash
# end

# puts hash_maker











# def hash_tester

#   haunt_hash = {}

#   href_arr.each do |state_href|
#     address = "#{state_href}"


#     state = state_name("#{address}")
#     describe = descriptions("#{address}")
#     information = haunt_info("#{address}")
#     information.each do |name_location|
#       name_location.each do |name, location|
#         describe.each do |haunt_desc|
#           if !haunt_hash[state]
#             haunt_hash[state] = [{ :name => name, :location => location, :description => haunt_desc }]
#           else
#             haunt_hash[state] << { :name => name, :location => location, :description => haunt_desc }
#           end
#         end
#       end
#     end
#   end
#   haunt_hash
# end

# def descriptions(state_href)

#   href = "#{state_href}"

#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   unparsed_info = doc.css(".page-inner p")

#   paragraph = ""
#   x = unparsed_info[3..-1]
#   x.each do |index|
#       description = index.text
#       if !description.empty?
#           paragraph << description
#       else
#           paragraph << "*"
#       end
#   end

#   h_description = paragraph.split("*")
#   last = h_description.pop.split(".")
#   h_description += [last[0..-2].join(".")]
#   h_description
# end

# def haunt_descriptions
#   tester = []
#   href_arr.each do |state_href|
#     href = "#{state_href}"
#     example = descriptions("#{href}")
#     tester << example
#   end
#   tester
# end

#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------


# def haunt_info(state_href)
#   haunt_names = []

#     href = "#{state_href}"

#     html = open("#{href}")
#     doc = Nokogiri::HTML(html)

#     places = doc.css(".section-title-main")

#     places.each do |index|
#       arr = []
#       haunt = index.text[3..-1]
#       haunt_names << haunt.split(", ")
#     end
 
#   haunt_names[0..-2]
# end


# def state_name(state_href)

#   href = "#{state_href}"

#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   state = doc.css(".entry-title").text.split(" ").last
# end

# def descriptions(state_href)

#   href = "#{state_href}"

#   html = open("#{href}")
#   doc = Nokogiri::HTML(html)

#   unparsed_info = doc.css(".page-inner p")

#   paragraph = ""
#   x = unparsed_info[3..-1]
#   x.each do |index|
#       description = index.text
#       if !description.empty?
#           paragraph << description
#       else
#           paragraph << "*"
#       end
#   end

#   h_description = paragraph.split("*")
#   last = h_description.pop.split(".")
#   h_description += [last[0..-2].join(".")]
#   h_description
# end


# def hash_tester

#   haunt_hash = {}

#   href_arr.each do |state_href|
#     address = "#{state_href}"

#     state = state_name("#{address}")
#     describe = descriptions("#{address}")
#     information = haunt_info("#{address}")
#     information.each do |name_location|
#       name_location.each do |name, location|
#         describe.each do |haunt_desc|
#           if !haunt_hash[state]
#             haunt_hash[state] = [{ :name => name, :location => location, :description => haunt_desc }]
#           else
#             haunt_hash[state] << { :name => name, :location => location, :description => haunt_desc }
#           end
#         end
#       end
#     end
#   end
#   haunt_hash
# end

# puts hash_tester




#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------


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

def haunt_hasher

  haunt_hash = {}
  href_arr.each do |state_href|

    haunt_hash = {}
    href = "#{state_href}"

    info = haunt_info(href)
    state = state_name(href)
    about = descriptions(href)
    
    info.each do |haunt|
      about.each do |describe|
        if haunt.length == 3
          if !haunt_hash[state]
              haunt_hash[state] = [{ :name => haunt[0], :city => haunt[1], :state => haunt[2], :description => describe }]
            # end
          else
            # haunt.each do |name, city, state_name|
              haunt_hash[state] << { :name => haunt[0], :city => haunt[1], :state => haunt[2], :description => describe }
            # end
          end
        else
          if !haunt_hash[state]
            # haunt.each do |name, city|
              haunt_hash[state] = [{ :name => haunt[0], :city => haunt[1], :state => state, :description => describe }]
            # end
          else
            # haunt.each do |name, city|
              haunt_hash[state] << { :name => haunt[0], :city => haunt[1], :state => state, :description => describe }
            # end
          end
        end
      end
    end
  end
  haunt_hash
end

puts haunt_hasher

  









