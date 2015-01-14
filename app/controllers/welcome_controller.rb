require 'open-uri'

class WelcomeController < ApplicationController
	def index
		@mb = {}

		#Get list of the mb
		mb_lotteries = Region.find_by_code("MB").lotteries.where(:open_date => "2015-01-13")
		@mb["date"] = "2015-01-13".to_date
		@mb["lot"] = mb_lotteries

		# #Get list of the mn
		# @mn_lotteries = Region.find_by_code("MN").lotteries.where(:open_date => "2015-01-13")
		
		# #Get list of the mt
		# @mt_lotteries = Region.find_by_code("MT").lotteries.where(:open_date => "2015-01-13")
	end

	def lichmothuong
		
	end

	def rss
		districts = {
			"TTH" => "Thừa Thiên Huế",
			"PY" => "Phú Yên",
			"DLK" => "Đắc Lắc", 
			"QNM" => "Quảng Nam",
			"DNG" => "Đà Nẵng", 
			"KH" => "Khánh Hòa", 
			"BDI" => "Bình Định",
			"QB" => "Quảng Bình", 
			"QT" => "Quảng Trị", 
			"GL" => "Gia Lai", 
			"NT" => "Ninh Thuận", 
			"DNO" => "Đắc Nông", 
			"QNG" => "Quảng Ngãi",
			"KT" => "Kon Tum", 
			"HCM" => "TP.HCM", 
			"CM" => "Cà Mau",
			"DT" => "Đồng Tháp", 
			"BL" => "Bạc Liêu", 
			"BT" => "Bến Tre", 
			"VT" => "Vũng Tàu", 
			"CT" => "Cần Thơ", 
			"DN" => "Đồng Nai", 
			"ST" => "Sóc Trăng", 
			"AG" => "An Giang", 
			"BTH" => "Bình Thuận", 
			"TN" => "Tây Ninh", 
			"BD" => "Bình Dương", 
			"TV" => "Trà Vinh", 
			"VL" => "Vĩnh Long", 
			"BP" => "Bình Phước", 
			"HG" => "Hậu Giang", 
			"LA" => "Long An", 
			"KG" => "Kiên Giang", 
			"LD" => "Lâm Đồng", 
			"TG" => "Tiền Giang"
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

			params = {
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
			}

			lot = Lottery.find_by({:open_date => params[:open_date], :district_id => params[:district_id]})
			
			if lot.nil?
				Lottery.create(params)
			end

			@items << result

			result = {}
		end


		render status: 200, json: @items
	end
end
