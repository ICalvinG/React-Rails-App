class Giphy < ApplicationRecord
	include HTTParty
	base_uri "http://api.giphy.com/v1/gifs"

	def post
		giphy_key = Rails.application.secrets.giphy_api_key
		tag = self.title.downcase.gsub(/[ ]/, "+")
		data = self.class.get("/random?api_key=#{giphy_key}&tag=#{tag}")
		json_file = JSON.parse(data.body)
		if data['data'].any?
			self.update_attributes(
				:url => data['data']['fixed_height_downsampled_url'],
				:height => increase(data['data']['fixed_height_downsampled_height']),
				:width => increase(data['data']['fixed_height_downsampled_width'])
				)
			self.save
		end
	end

	def increase(str)
		(str.to_i + 15).to_s
	end

	# Method to seed database with trending gifs
	# def trend
	# 	giphy_key = Rails.application.secrets.giphy_api_key
	# 	data = self.class.get("/trending?api_key=#{giphy_key}")
	# 	json_file = JSON.parse(data.body)
	# 	if data['data'].any?
	# 		self.update_attributes(
	# 			:url => data["data"][self.id]["images"]["fixed_width"]["url"],
	# 			:height => data["data"][self.id]["images"]["fixed_width"]["height"],
	# 			:width => 200
	# 			)
	# 		self.save
	# 	end
	# end

end