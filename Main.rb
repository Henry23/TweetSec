
require_relative 'YouShallNotPassword'
require_relative 'test'

_res = ""
while _res != 3
	puts "
		1. Evaluate Password
		2. Run tests
		3. exit"
	_res = gets.to_i
	if (_res == 1)
		_res = 1
		puts "Enter your password: "
		pass = gets.chomp
		# Now using above class to create TweetSec
		eval = YouShallNotPassword. new(pass).responses
		puts eval
	elsif (_res == 2)
		system("ruby test.rb")
		system("false")
	elsif (_res == 3)
		puts "Quitting"
		exit
	end
end

# pass1 = YouShallNotPassword. new("password1")
# pass2 = YouShallNotPassword. new("passwordfun1")
# pass3 = YouShallNotPassword. new("goat m4n")
# pass4 = YouShallNotPassword. new("s0_0per 5nak3")


# puts pass1.responses
# puts pass2.responses
# puts pass3.responses
# puts pass4.responses



