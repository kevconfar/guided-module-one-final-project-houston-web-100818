def run
    welcome
    input = get_user_input
end

def welcome
    puts "Hello! Welcome to this app. Also, you're welcome. And, FU."
end

# def get_user_input
#     input = gets.chomp
# end

def find_posts(topic)
    topic.posts
  end

  def show_posts(topics)
    posts.each do |topic|
      #how could we output each post name here?
     end
  end