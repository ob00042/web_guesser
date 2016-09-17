require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
	guess = params["guess"]
	message = check_guess(guess, number)
	erb :index, :locals => {:number => number, :guess => guess, :message => message}
end

def check_guess(guess, number)
	guess = guess.to_i
	if guess.nil?
		"Make a guess"
	end
	if guess > number + 5
		"Way too high!"
	elsif guess > number
		"Too high!"
	elsif guess < number - 5
		"Way too low!"
	elsif guess < number
		"Too low!"
	else
		"You got it right!"
	end
end