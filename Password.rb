#!/usr/bin/env ruby
require 'json'

class Password
	def initialize(pass)
		@pass = pass.downcase
	end

	def strength
		_result = JSON.parse(score)
		return _result["lenCount"] * _result["typesCount"]
	end

	###
	# this gets the number of represented character types
	# and the length of the text
	###
	def score
		len = 0
		types = 0
		if (@pass == nil || @pass.length == 0)
			return { lenCount: len, typesCount: types}.to_json
		end
		#match all letter in the password string
		r = /[a-zA-z]/
		alphabetLen = @pass.match(r)
		if (alphabetLen != nil)
			types += 1
		end
		#match all numbers in the password string
		r = /\d/
		numLen = @pass.match(r)
		if (numLen != nil)
			types += 1
		end

		#match all spaces, tabs, newline in the password string
		r = /\s|\t|\n/
		char = @pass.match(r)
		if (char != nil)
			types += 1
		end

		#match all punctuation, unicode characters in the password string
		r = /[^A-Za-z0-9\t\n \\s]/
		others = @pass.match(r)
		if (others != nil )
			types += 1
		end
		len = @pass.length
		#len = @pass.match(/(\w+)([a-z])|([0-9])|(\s)/).size
		return { lenCount: len, typesCount: types}.to_json
	end

end