require 'sinatra/base'
require './lib/NumbersToWords.module.rb'
require './lib/NumbersToWords.rb'

class NumbersToWordsApp < Sinatra::Base
	get '/' do
		if (params.include?("numbers") && params[:numbers].empty?)
			redirect '/'
		end
		@n2w = NumbersToWords.new
		@n2w.context = params["context"]
		erb :ruby,
		:locals => {
			converted: params[:numbers] ? @n2w.convert(params[:numbers]) : "",
			input: params["numbers"],
			input_context: params["context"]
		}
	end
	get '/js' do
		erb :javascript
	end
	run! if app_file == $0
end