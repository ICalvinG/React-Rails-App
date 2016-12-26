class Giphy < ApplicationRecord
	include HTTParty
	base_uri "http://api.giphy.com/v1/gifs/random?"

	def post
		gif = Giphy.find(1)
		giphy_key = Rails.application.secrets.giphy_api_key
		tag = Giphy.find(1).title.downcase.gsub(/[ ]/, "+")
		data = self.class.get("api_key=#{giphy_key}&tag=#{tag}")
		json_file = JSON.parse(data.body)
		if data['data'].any?
			gif.update_attributes(
				:url => data['data']['fixed_height_downsampled_url'],
				:height => data['data']['fixed_height_downsampled_height'],
				:width => data['data']['fixed_height_downsampled_width']
				)
			gif.save
		end
	end

end