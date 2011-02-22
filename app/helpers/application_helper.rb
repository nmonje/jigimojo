module ApplicationHelper
end


#require 'net/http'

#def api_key
#	api_key = 'C4YBICJ89BSXEIOH0'
#end

#def default_image
#	image = '/images/rails.png'
#end

#def default_track
#	track = 'songs/grace_kelly.mp3'
#end

#def tags_of_image(image_url = nil)
#	api_server = 'http://developer.echonest.com/api/v4/'
#	api_key_s = "api_key=#{api_key}&"
#	search_request = 'song/search?'
#	options = 'title=Grace%20Kelly&artist=Mika'
#	request = api_server + search_request + api_key_s + options
#	request_url = URI.parse(request)
#	response = Net::HTTP.get(request_url)
#	result = ActiveSupport::JSON.decode(response)
#	song_id = result["response"]["songs"].first["id"]
#	return song_id
# end

