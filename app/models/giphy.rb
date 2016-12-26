class Giphy < ApplicationRecord
	include HTTParty
	base_uri "http://api.giphy.com/v1/gifs/random?"

	def post
		giphy_key = Rails.application.secrets.giphy_api_key
		tag = self.title.downcase.gsub(/[ ]/, "+")
		data = self.class.get("api_key=#{giphy_key}&tag=#{tag}")
		json_file = JSON.parse(data.body)
		if data['data'].any?
			self.update_attributes(
				:url => data['data']['fixed_height_downsampled_url'],
				:height => data['data']['fixed_height_downsampled_height'],
				:width => data['data']['fixed_height_downsampled_width']
				)
			self.save
		end
	end

end