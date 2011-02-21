module ApplicationHelper

require 'net/http'

def tags_of_image(image_url = nil)
	api_server = 'http://developer.echonest.com/api/v4/'
	api_key = 'api_key=C4YBICJ89BSXEIOH0&'
	search_request = 'song/search?'
	options = 'title=Grace%20Kelly&artist=Mika'
	request = api_server + search_request + api_key + options
	request_url = URI.parse(request)
	response = Net::HTTP.get(request_url)
	result = ActiveSupport::JSON.decode(response)
	song_id = result["response"]["songs"].first["id"]
	return song_id
end

end
