require 'sinatra/base'
require './lib/NumbersToWords.module.rb'
require './lib/NumbersToWords.rb'

class NumbersToWordsApp < Sinatra::Base
	get '/' do
		if (params.include?("numbers") && params[:numbers].empty?)
			redirect '/'
		end
		erb :index, :locals => {
			converted: NumbersToWords.new.convert(params[:numbers]),
			input: params["numbers"]
		}
	end
	run! if app_file == $0
end