require_relative '../config/environment'

$prompt = TTY::Prompt.new

$start_menu_choices = {
  "Search haunts by name" => 0,
  "Search haunts by location" => 1, #update location to STATE
  "Search haunts by type of haunting" => 2, # maybe change to type of experience or thrill
  # i also want user to be able to search for haunted accomodations exp: hotel or B&B (Will need to possibly build another scraper to itterate through the haunted accomodation page)
  "Exit" => 3
}

# v aybe change to type of experience or thrill
$type_of_haunting_menu_choices = { #Will need to make array of the thrill options containing descriptive keywords (that will be used to itterate through haunt descriptions and return matching haunts)
  "Visual" => 1,
  #"Intelligent" => 2, remove
  "Physical" => 3,
  "Auditory" => 4,
  "Back" => 5
}

def messages(name=nil)
    {
      start: "Pick your haunt: ",
      location: "Where would you like to be scared? ", #update location to STATE
      type_of_haunting: "What kind of experience are you looking for? ",
      move_on: "#{name}, are you ready to be scared!? ",
      move_on_again: "Are you sure you can handle it?",
      continue_message1: "Don't be a wuss. Let's do this anyway.",
      continue_message2: "Let's get scared! ",
      welcome: "Welcome to the Haunt. What's your name?",
      input_error: "Sorry, please try again.",
      exit: "Scaredy Cat!",
      haunt_search: "Enter the name of the haunted place you're looking: "
    }
  end


def response_choices
    {
      move_on_choices: %w(Yes No),
      move_on_again_choices: %w(I\ was\ born\ ready Probably\ not),
      next_or_back_choices: %w(Next\ review Back)
    }
  end

  def welcome_get_name
    name = $prompt.ask(messages[:welcome]) do |q|
      q.required true
      q.validate /\A\w+\Z/
      q.modify   :capitalize
    end
  end

  def move_on(name)
    move_on = $prompt.select(messages(name)[:move_on], response_choices[:move_on_choices])
  end
  
  def exit?
    puts messages[:exit]
    exit
  end
  
  def continue_message
    move_on_again = $prompt.select(messages[:move_on_again], response_choices[:move_on_again_choices])
    if move_on_again == "Probably not"
      print messages[:continue_message1]
      return "scaredy cat"
    else
      print messages[:continue_message2]
      return "good choice"
    end
  end

  def launch_menu(menu_choice, message)
    $prompt.select(message, menu_choice)
  end
  
  def launch_first_menu(name=nil)
    start_choice = launch_menu($start_menu_choices, messages(name)[:start])
  
    case start_choice
    when 0
      bar_name = $prompt.select(messages[:haunt_search], filter: true) do |options|
        Haunt.all.collect do |haunt|
          options.choice haunt.name
        end
      end
      haunt_reviews = Haunt.find_by(name: haunt_name).reviews.order("rating")
      haunt_search_printer(haunt_name, haunt_reviews)
      launch_first_menu
    when 1
      location_choice = Haunt.find_by(location: location_name).haunts.order("alphabetical") #update location to STATE
      haunt_search_printer(location_name)
      launch_first_menu
    when 2
      type_of_haunting_choice = launch_menu($type_of_haunting_menu_choices, messages[:type_of_haunting])
      launch_type_of_haunting_menu(type_of_haunting_choice)
    when 3
      exit
    end
  end

  def launch_type_of_haunting_menu(type_of_haunting_choice)


  end
  

# def run
#     welcome
#     input = gets_user_input
#     find_haunt(input)
# end

# def welcome
#     puts "Welcome to Haunt. Let's find something to scare you."
# end

# # def get_user_input
# #     input = gets.chomp
# # end
# def gets_user_input
#     puts "We can help you find haunted hotels near you!"
#     puts "Enter a location to get started:"
#     location = gets.chomp
# end

