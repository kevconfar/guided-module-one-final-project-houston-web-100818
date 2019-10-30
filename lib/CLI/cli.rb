def run
    welcome
    input = gets_user_input
    find_haunt(input)
end

def welcome
    puts "Welcome to Haunt. Let's find something to scare you."
end

# def get_user_input
#     input = gets.chomp
# end
def gets_user_input
    puts "We can help you find haunted hotels near you!"
    puts "Enter a location to get started:"
    location = gets.chomp
end

