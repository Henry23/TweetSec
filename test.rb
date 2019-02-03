require "test-unit"
require 'json'
require_relative 'Password'
require_relative 'YouShallNotPassword'

class MyTest < Test::Unit::TestCase

	def test_1
		_result = JSON.parse( Password.new("s0_0per 5n4k3").score )
		expected = 4
		assert_equal(expected, _result["typesCount"], "Error types count!!!" )
	end

	def test_2
		_result = JSON.parse( Password.new("s0_0per 5n4k3").score )
		expected = 13
		assert_equal(expected, _result["lenCount"],  "Error text length Count!!!"  )
	end

	def test_3
		_result = JSON.parse( Password.new("passwordfun1").score )
		expected = 2
		assert_equal(expected, _result["typesCount"],  "Error types count!!!" )
	end

	def test_4
		_result = JSON.parse( Password.new("passwordfun1").score )
		expected = 12
		assert_equal(expected, _result["lenCount"],  "Error text length Count!!!"  )
	end

	def test_5
		_result = Password.new("s0_0per 5nak3").strength
		expected = 52
		assert_equal(expected, _result,  "Error Password (s0_0per 5nak3 --> #{_result}) Strength Count!!!"  )
	end

	def test_6
		_result = Password.new("goat m4n").strength
		expected = 24 #15
		assert_equal(expected, _result, "Error Password (goat m4n --> #{_result}) Strength Count!!!"  )
	end

	def test_7
		_result = Password.new("passwordfun1").strength
		expected = 24 # 6
		assert_equal(expected, _result, "Error Password (passwordfun1 --> #{_result}) Strength Count!!!"  )
	end

	def test_8
		_result = Password.new("password1").strength
		expected = 18 #2
		assert_equal(expected, _result, "Error Password (password1 --> #{_result}) Strength Count!!!"  )
	end

	def test_9
		_result = YouShallNotPassword. new("aaaaaaaaaaaaa")
		_result.suggestion
		assert_equal("Congratulations is Strong Password.", _result.responses, "Error on suggestion  "  )
	end

	def test_10
		_result = YouShallNotPassword. new("aaaaaaa")
		_result.suggestion
		assert_equal("Congratulations is Strong Password.", _result.responses, "Error on suggestion  "  )
	end

end