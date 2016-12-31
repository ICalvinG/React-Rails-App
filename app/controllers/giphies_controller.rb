class GiphiesController < ApplicationController
	before_filter :trending, :only => :index

	def index
		@giphies = Giphy.all
		if params["gif"].nil? == false
			gif = params["gif"]
			if !Giphy.where(id: 1).nil?
				Giphy.destroy_all
				@searched_gif = Giphy.new(id: 1, title: gif)
				@searched_gif.save
				if @searched_gif.save
					@searched_gif.post
					if !@searched_gif.url.nil?
						render 'success'
					else
						@fail_gif = Giphy.new(id: 2, title: "facepalm")
						@fail_gif.save
						if @fail_gif.save
							@fail_gif.post
						end
						render 'none'
					end
				end
			end
			Giphy.destroy_all
			ActiveRecord::Tasks::DatabaseTasks.purge_current
    		ActiveRecord::Tasks::DatabaseTasks.migrate
		end
	end

	def trending
		for i in 3..10
		@test = Giphy.new
			if @test.save
				@test.trend 
			end
		end
	end
	
end