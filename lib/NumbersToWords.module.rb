module NumbersToWords_Module

	# ADD NAMES OF LARGE NUMBERS
	WORDS = 'hundred thousand million billion trillion gazillion'.split(" ").map(&:capitalize)

	# DO NOT EDIT THE FOLLOWING VALUES
	ONES = 'zero one two three four five six seven eight nine ten'.split(" ").map(&:capitalize)
	TENS = 'eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty'.split(" ").map(&:capitalize)
	MULTIPLES_OF_TEN = 'ten twenty thirty fourty fifty sixty seventy eighty ninty hundred'.split(" ").map(&:capitalize)

	def convert(number)
		output = []
		number_parsed = parse(number)
		return "<i>Error: number too large. Largest allowed is: " + WORDS.last.capitalize + "s</i>" if number_parsed.count > WORDS.count
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
		number = number.to_i
		return '' if number < 1
		return ONES[number] if number <= 10
		return TENS[number-11] if number <= 20
		if number <= 99
			return MULTIPLES_OF_TEN[number/10-1] + (number.to_s[1].to_i > 0 ? '-'+ONES[number%10] : '')
		end
		result.to_s
	end

	def convert_segment(number)
		return '' if number.to_i < 1
		number_arr = number.to_s.split("")
		length = number_arr.length
		return false if length > 3
		output = ''
		if length == 3
			output += convert_number(number.to_s[0])
			output += ' ' + WORDS[0] + ' ' if !convert_number(number.to_s[0]).empty?
			if number.to_s[1..-1].to_i > 0
				output += 'and ' if !convert_number(number.to_s[0]).empty?
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