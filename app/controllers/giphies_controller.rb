class GiphiesController < ApplicationController

	def index
		@giphies = Giphy.all
		if params["gif"].nil? == false
			gif = params["gif"]
			if @searched_gif.instance_of? Giphy
				Giphy.destroy_all
			else
				@searched_gif = Giphy.new(id: 1, title: gif)
				@searched_gif.save
				if @searched_gif.save
					@searched_gif.update_attributes(:url => @searched_gif.post)
					if !@searched_gif.url.nil?
						render 'success'
					else
						render 'none'
					end
				end
			end
			Giphy.destroy_all
		end
	end
	
end