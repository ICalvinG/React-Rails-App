class GiphiesController < ApplicationController

	def index
		@giphies = Giphy.all
		if params["gif"].nil? == false
			gif = params["gif"]
			if Giphy.where(id: 1).nil?
				Giphy.destroy_all
			else
				@searched_gif = Giphy.new(id: 1, title: gif)
				@searched_gif.save
				if @searched_gif.save
					@searched_gif.post
					@gif_result = Giphy.find(1)
					if !@gif_result.url.nil?
						render 'success'
					else
						@fail_gif = Giphy.new(id: 2, title: "sorry")
						@fail_gif.save
						if @fail_gif.save
							@fail_gif.post
							@sorry_gif = Giphy.find(2)
						end
						render 'none'
					end
				end
			end
			Giphy.destroy_all
		end
	end
	
end