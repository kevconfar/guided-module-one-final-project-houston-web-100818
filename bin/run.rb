require_relative 'config/environment'

def gets_user_input
    puts "We can help you find haunted hotels near you!"
    puts "Enter a location to get started:"
    location = gets.chomp
end

gets_user_input