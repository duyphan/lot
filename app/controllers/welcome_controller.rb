require 'open-uri'

class WelcomeController < ApplicationController
	def index
		
	end

	def lichmothuong
		
	end

	def rss
		districts = {
			"TTH" => "Thua Thien Hue",
			"PY" => "Phu Yen"
		}
		@items = []
		result = {}
		xml = RestClient.get 'http://ket-qua.com/rss/ket-qua-Xo-so-Mien-Trung-xsmt.rss'

		hash = Hash.from_xml(xml).to_json
		json = JSON.parse(hash)
		rss = json['rss']['channel']['item']

		rss.each do |item|
			result['pubDate'] = item['pubDate']
			result['description'] = item['description']

			description = result['description']

			# Get index
			indexOfDB = description.index("DB")

			des0 = description[0..indexOfDB-1]
			des1 = description[indexOfDB..description.length]

			list_lots = des1.to_s.split(" ")

			list_lots.each do |lot|
				lot_number = lot.split(":")
				ordinal_number = lot_number[0]
				number = lot_number[1].split("-")

				result[ordinal_number] = number
			end

			result["code"] = des0.split(" ")[0]

			name = districts[result["code"]]

			# Insert district, region_id = 2
			district = District.find_by_code(result["code"])
			if district.nil?
				district = District.new({:name => name, :region_id => 2, :code => result["code"]})
				district.save!
			end

			lot = Lottery.new({
				:open_date => result['pubDate'], 
				:special => result['DB'][0], 
				:first => result['1'][0],
				:second => result['2'],
				:third => result['3'],
				:fourth => result['4'],
				:fifth => result['5'],
				:sixth => result['6'],
				:seventh => result['7'],
				:eighth => result['8'],
				:district_id => district.id
			})

			lot.save!

			@items << result

			result = {}
		end


		render status: 200, json: @items
	end
end
