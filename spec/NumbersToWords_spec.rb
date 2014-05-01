require 'NumbersToWords'

describe NumbersToWords do

	let(:number_to_words) { NumbersToWords.new }

	it 'formats the number "1234" into "1,234"' do
		expect(number_to_words.format(1234)).to eq "1,234"
	end

end