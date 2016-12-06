class Giphy < ApplicationRecord
	include HTTParty
	base_uri "http://api.giphy.com/v1/gifs/random?"

	def post
		giphy_key = Rails.application.secrets.giphy_api_key
		tag = Giphy.find(1).title.downcase.gsub(/[ ]/, "+")
		data = self.class.get("api_key=#{giphy_key}&tag=#{tag}")
		json_file = JSON.parse(data.body)
		url = data['data']['fixed_height_downsampled_url']
	end

end