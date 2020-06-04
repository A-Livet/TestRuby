# ========= 1 =========

# Implement the function closestToZero which will return the closest value to 0 in an array.
# Return 0 if the array is empty or if the argument passed to the function isn't an array.
# Return only the positive value if a negative and a positive value match your condition.

def closest_to_zero(a)
  	if a.nil?
  		return 0
 	elsif a.respond_to?("each")
 		closest = a.at(0)
 		a.each do |number|
 			if (0-number).abs < (0-closest).abs
 				closest = number
 			elsif (0-number).abs = (0-closest).abs
 				if number>0
 					closest = number
 				end
 			end
 		end
 		return closest
 	else
 		return 0
 	end
end

# ========= 2 =========

# Implement the function `absurdStringFunction` which will take two strings
# If a word in the first string contains the second, delete it
# Eg: `absurdStringFunction("Bonjour le monde et patrick !", "e")` will return "bonjour    patrick !"
# because "le", "monde" and "et" contains "e"
# `absurdStringFunction("foo, bar, buz; qux", "b")` will return "foo, , ; qux"

def absurd_string_function(str, remove)

  if str.nil?
  	return ""
  else 
  	words = str.split(/\W+/)
  	words.each_with_index do |word,item|
  		if word.include? remove
  			words.delete_at(index)
  		end
  	return words.join(' ')
  end

end

# ========= 3 =========

# Write a class that takes an integer on construct
# Implement the following methods :
# - `increment` takes an integer or nothing for parameter and increments the initial number with the number passed as param
#    or by one if no param is passed. Returns the number incremented
# - `decrement` same as `increment` but decrements the number
# - `reset` takes no params, resets the number to his initial value
# - Ensure the param passed to `increment` and `decrement` or on construct is an integer if present, throw an exception otherwise
# - Implement the following aliases: `do_increment`, `do_decrement` and `do_reset` on the previous methods
# - `history` takes no params, returns an array with all the modifications done on the number, but not the number itself
#    eg: ["decrement", "increment 3", "reset", "increment 10"]
# - `replay` will be an iterator which replay the history

class MyClass

	def initialize(int)
		@int = int
		@initial_value = int
		@history = Array.new
	end

	def increment(i=1)
		if i.is_a? Integer
			@int+=i
			return @int
			@history.push("increment #{i}")
		else
			raise 'parameter is not an integer'
	end

	def decrement(i=1)
		if i.is_a? Integer
			@int-=i
			return @int
			@history.push("decrement #{i}")
		else
			raise 'parameter is not an integer'
	end

	def reset
		@int = @initial_value
		@history.push("reset")
	end

	alias :do_increment :increment
	alias :do_reset :reset
	alias :do_decrement :decrement


	def history
		return @history
	end

end

