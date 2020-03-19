# PHASE 2
def convert_to_int(str)
  begin
    Integer(str) 
  rescue ArgumentError => e
    puts "Error:  #{e.inspect}"
  ensure
    return nil
  end 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    if maybe_fruit == "coffee"
      raise CoffeeError
    else
      raise StandardError
    end
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts "Thanks for the coffee but try something different"
    retry
  rescue StandardError => e
     puts "Sorry, I dont eat that"
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Sorry, you need to know each other for 5 years or more to be considered best friends!" if yrs_known < 5
    raise "Provide a name" if name.empty?
    raise "Provide a pastime" if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


