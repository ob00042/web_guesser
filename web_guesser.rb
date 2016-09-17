require 'sinatra'
require 'sinatra/reloader'

@@guesses = 5
number = rand(100)
@@win = false


get '/' do
	if @@guesses < 0 || @@win
		@@guesses = 5
		number = rand(100)
		@@win = false
	end
	cheat = params["cheat"]
	guess = params["guess"]
	@color = "white"
	@game_over = false
	message = check_guess(guess, number)
	erb :index, :locals => {:number => number, :guess => guess, :message => message, :color => @color, :game_over => @game_over, :cheat => cheat}
end

def check_guess(guess, number)
	guess = guess.to_i
	@@guesses -= 1
	if @@guesses < 0
		@game_over = true
		@@guess = 5
	elsif guess > number + 5
		@color = "red"
		"Way too high!"
	elsif guess > number
		@color = "blue"
		"Too high!"
	elsif guess < number - 5
		@color = "red"
		"Way too low!"
	elsif guess < number
		@color = "blue"
		"Too low!"
	else
		@@win = true
		@color = "green"
		"You got it right!
		Hit REFRESH for a new game"
	end
end