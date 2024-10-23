
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
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six)
end
# Dice 2/10
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_ten)
end
# Dice 1/20
get("/dice/1/20") do
  first_die = rand(1..20)
  sum = first_die
	
  @outcome = "You rolled a #{first_die} for a total of #{sum}."
	
  erb(:one_twenty)
end
# Dice 5/4
get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  @outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die}, for a total of #{sum}."
	
  erb(:five_four)
end
