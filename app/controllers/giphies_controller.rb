class GiphiesController < ApplicationController

	def index
		@giphies = Giphy.all
		if params["gif"].nil? == false
			gif = params["gif"]
			searched_gif = Giphy.new(title: gif)
			searched_gif.save
			searched_gif.post
			Giphy.find(1).destroy
		end
	end

end