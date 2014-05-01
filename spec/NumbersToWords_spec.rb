require 'NumbersToWords'

describe NumbersToWords do

	let(:number_to_words) { NumbersToWords.new }

	it 'formats the number "1234" into "1,234"' do
		expect(number_to_words.format(1234)).to eq "1,234"
	end

	context 'when given a segment array' do

		it 'converts the "1" to "One"' do
			expect(number_to_words.convert_segment(1)).to eq "One"
		end

		it 'converts the "15" to "Fifteen"' do
			expect(number_to_words.convert_segment(15)).to eq "Fifteen"
		end

		it 'converts the "371" to "Three Hundred and Seventy One"' do
			expect(number_to_words.convert_segment(371)).to eq "Three Hundred and Seventy One"
		end

	end

	it 'converts "1513243" to "One Million Five Hundred and Thirteen Thousand Two Hundred and Fourty Three' do
		expect(number_to_words.convert(1513243)).to eq "One Million Five Hundred and Thirteen Thousand Two Hundred and Fourty Three"
	end

end