class GiphiesController < ApplicationController

	def index
		@giphies = Giphy.all
	end

end