module NumbersToWords_Module

	WORDS = {
		ones: 'one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen'.split(" ").map(&:capitalize),
		tens: 'ten twenty thirty fourty fifty sixty seventy eighty ninty'.split(" ").map(&:capitalize),
	}

	def format(number)
		number.to_s.chars.reverse.each_slice(3).map(&:join).join(",").reverse
	end

	def convert_segment(number)
		output = ''
		number_int = number.to_i
		number_str = number.to_s
		length = number_str.length
		return 'zero' if number_int == 0
		return false if length > 3
		if ( length == 1 || length == 2 ) && number_int < 20
			output += WORDS[:ones][number_int-1]
		elsif length == 2 && number_int >= 20
			segment_1 = number_str[0].to_i
			segment_2 = number_str[1].to_i
			output += WORDS[:tens][segment_1.to_i-1]
			output += " " + WORDS[:ones][segment_2-1] if segment_2 > 0
		elsif length == 3 && number_int >= 20
			segment_1 = number_str[0].to_i
			segment_2 = (number_str[1]+number_str[2]).to_i
			output += WORDS[:ones][segment_1.to_i-1]
			output += " Hundred and "
			if segment_2 < 20
				output += WORDS[:ones][segment_2-1]
			elsif segment_2 >= 20
				output += WORDS[:tens][number_str[1].to_i-1]
				output += " " + WORDS[:ones][number_str[2].to_i-1] if number_str[2].to_i > 0
			end
		end
		output
	end

	def convert(number)
		number_arr = format(number).split(",")
		total_segments = number_arr.count
		output = ''
		number_arr.each_with_index do |segment, count|
			count = count+1
			output += convert_segment(segment)
			if (total_segments == 2 && count == 1) || (total_segments == 3 && count == 2)
				output += " Thousand "
			elsif total_segments == 3 && count == 1
				output += " Million "
			end
		end
		output
	end

end