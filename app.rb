require 'sinatra'
require './lib/NumbersToWords.module.rb'
require './lib/NumbersToWords.rb'

get '/' do
	puts params
	if (params.include?("numbers") && params[:numbers].empty?)
		redirect '/'
	end
	erb :index, :locals => {
		converted: NumbersToWords.new.convert(params[:numbers]),
		input: params["numbers"]
	}
end