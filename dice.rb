
require "sinatra/reloader"
require "sinatra"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# /dice.rb

get("/") do
    erb(:elephant)
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end
# Dice 2/6
get("/dice/2/6") do
  @rolls = [] 
  2.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end
 
  erb(:two_six)
end
# Dice 2/10
get("/dice/2/10") do
  @rolls = [] 
  2.times do    # 100 times...
    die = rand(1..10)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end
	
  erb(:two_ten)
end
# Dice 1/20
get("/dice/1/20") do
  @rolls = [] 
  1.times do    # 100 times...
    die = rand(1..20)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_twenty)
end
# Dice 5/4
get("/dice/5/4") do
  @rolls = [] 
  5.times do    # 100 times...
    die = rand(1..4)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end
	
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
