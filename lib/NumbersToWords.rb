class NumbersToWords
	def format(number)
		number.to_s.chars.reverse.each_slice(3).map(&:join).join(",").reverse
	end
end