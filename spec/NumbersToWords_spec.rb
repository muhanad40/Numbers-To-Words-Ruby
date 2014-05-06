require 'NumbersToWords.module'
require 'NumbersToWords'
require 'String.class'
require 'Fixnum.class'

describe NumbersToWords do

	let(:number_to_words) { NumbersToWords.new }

	context 'when given a segment' do

		it 'converts the "1" to "One"' do
			expect(number_to_words.send(:convert_segment, 1)).to eq "One"
		end

		it 'converts the "311" to "Three Hundred and Eleven"' do
			expect(number_to_words.send(:convert_segment, 311)).to eq "Three Hundred and Eleven"
		end

		it 'converts the "15" to "Fifteen"' do
			expect(number_to_words.send(:convert_segment, 15)).to eq "Fifteen"
		end

		it 'converts the "371" to "Three Hundred and Seventy-One"' do
			expect(number_to_words.send(:convert_segment, 371)).to eq "Three Hundred and Seventy-One"
		end

	end

	it 'converts "1513243" to "One Million, Five Hundred and Thirteen Thousand, Two Hundred and Fourty-Three' do
		expect(number_to_words.convert(1513243)).to eq "One Million, Five Hundred and Thirteen Thousand, Two Hundred and Fourty-Three"
	end

	it 'converts the string "123456" to "One Hundred and Twenty-Three Thousand, Four Hundred and Fifty-Six"' do
		expect("123456".NumbersToWords).to eq "One Hundred and Twenty-Three Thousand, Four Hundred and Fifty-Six"
	end

	it 'converts the integer 123456 to "One Hundred and Twenty-Three Thousand, Four Hundred and Fifty-Six"' do
		expect(123456.NumbersToWords).to eq "One Hundred and Twenty-Three Thousand, Four Hundred and Fifty-Six"
	end

end