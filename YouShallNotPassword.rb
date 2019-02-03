#!/usr/bin/ruby
require_relative 'Password'
require 'date'

class YouShallNotPassword
	def initialize(pass)
		@pass = pass
	end
	###
	# only returns the strength rating of a password,
	###
	def responses
		_score = Password. new(@pass).strength
		if (_score >= 50)
			return "Congratulations is Strong Password."
		elsif (_score > 10 && _score < 50)
			return "Weak Password. try with '#{suggestion}'"
		else
			return "Unacceptable Password, try again with a better password."
		end
	end
	###
	# this replace the first 4 characters of the string with random number,
	#  other (punctuation, unicode characters, etc.) and whitespace (spaces, tabs, newline characters)
	#  so the number of types is 4 Multiply by the length  of the updated text
	#  but if the length is less than 13 the password will always week to we add the current tiem at the end
	####
	def suggestion
		newpass = @pass
		r = /[^a]/
		newpass = newpass.sub(/[a-z]/, "#{rand(10)}")
		newpass = newpass.sub(/[a-z]/, '$')
		newpass = newpass.sub(/[a-z]/, ' ')
		if newpass.length <= 13
			time = Time .new
			newpass = "#{newpass} #{time.to_i}"
		end
		_score = Password. new(newpass).strength
		return @pass = newpass
	end
	#password1
	#p0ss
end


