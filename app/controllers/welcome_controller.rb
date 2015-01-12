require 'open-uri'

class WelcomeController < ApplicationController
	def index
		
	end

	def lichmothuong
		
	end

	def rss
		xml = RestClient.get 'http://ket-qua.com/rss/ket-qua-Xo-so-Mien-Trung-xsmt.rss'

		hash = Hash.from_xml(xml).to_json
		json = JSON.parse(hash)
		@rss = json['rss']['channel']['item']

		render status: 200, json: @rss
	end
end
