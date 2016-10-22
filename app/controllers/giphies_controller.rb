class GiphiesController < ApplicationController

	def index
		@giphies = Giphy.all
		if params["gif"].nil? == false
			gif = params["gif"]
			searched_gif = Giphy.new(id: 1, title: gif)
			searched_gif.save
			searched_gif.post
			Giphy.destroy_all
		end
	end

end