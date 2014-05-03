module NumbersToWords_Module

	# ADD NAMES OF LARGE NUMBERS
	WORDS = 'hundred thousand million billion trillion gazillion'.split(" ").map(&:capitalize)

	# DO NOT EDIT THE FOLLOWING VALUES
	ONES = 'one two three four five six seven eight nine ten'.split(" ").map(&:capitalize)
	TENS = 'eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty'.split(" ").map(&:capitalize)
	MULTIPLES_OF_TEN = 'ten twenty thirty fourty fifty sixty seventy eighty ninty hundred'.split(" ").map(&:capitalize)

	def convert(number)
		output = []
		number_parsed = parse(number)
		number_parsed.reverse.each_with_index do |segment, index|
			if index == 0
				output << convert_segment(segment.join)
			else
				output << convert_segment(segment.join) + ' ' + WORDS[index] + ','
			end
		end
		output.reverse.join(" ")
	end

	private
	
	def convert_number(number)
		return false if number == 0
		number = number.to_i
		number_str = number.to_s
		return false if number > 99
		if number <= 10
			result = ONES[number-1]
		elsif number >= 11 && number <= 20
			result = TENS[(number-1)-10]
		elsif number >= 21 && number <= 99
			result = MULTIPLES_OF_TEN[number_str[0].to_i-1]
			result += '-' + ONES[number_str[1].to_i-1]
		end
		result.to_s
	end

	def convert_segment(number)
		number_arr = number.to_s.split("")
		length = number_arr.length
		return false if length > 3
		output = ''
		if length == 3
			output += convert_number(number.to_s[0])
			output += ' ' + WORDS[0] + ' '
			if number.to_s[1..-1].to_i > 0
				output += 'and '
				output += convert_number(number.to_s[1..-1])
			end
		else
			output += convert_number(number.to_s[0..-1])
		end
		output
	end

	def parse(number)
		number.to_s.split('').reverse.each_slice(3).to_a.map(&:reverse).reverse
	end

end