class Import
	def initialize
		puts "initialize"
	end
	def action
		
		# List districts
		districts = {
			"QN" => "Quảng Ninh",
			"BN" => "Bắc Ninh",
			"TD" => "Hà Nội",
			"TB" => "Thái Bình",
			"ND" => "Nam Định",
			"HP" => "Hải Phòng",
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
			"BTR" => "Bến Tre", 
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

		# Get URL 
		rss_lists = LOT_CONFIG["rss_lists"]
		district_lists = LOT_CONFIG["district_lists"]

		if rss_lists.any?
			rss_lists.each do |rss|

				puts rss["url"]

				result = {}

				# Get xml data from rss
				xml = RestClient.get rss["url"]

				# Parse to json
				hash = Hash.from_xml(xml).to_json
				json = JSON.parse(hash)

				# List items
				items = json['rss']['channel']['item']

				# Loop items
				items.each do |item|
					result['pubDate'] = item['pubDate']
					result['description'] = item['description']

					# description
					description = result['description']

					# Excute with description to analyze result
					# Get index of 'DB' text
					indexOfDB = description.index("DB")
					des0 = description[0..indexOfDB-1]
					des1 = description[indexOfDB..description.length]

					# List result number lotteries
					list_lots = des1.to_s.split(" ")
					list_lots.each do |lot|
						lot_number = lot.split(":")
						ordinal_number = lot_number[0]
						number = lot_number[1].split("-")

						result[ordinal_number] = number
					end

					# Code of district
					result["code"] = des0.split(" ")[0]

					# TODO: FIX IT
					name = districts[result["code"]]

					# Insert district, region_id = 2
					district = District.find_by_code(result["code"])

					# Get id with code
					region = Region.find_by_code(rss["code"])

					if region.nil? 
						region = Region.create({:name => rss["name"], :code => rss["code"]})
					end

					if district.nil?
						district = District.new({:name => name, :region_id => region.id, :code => result["code"]})
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
						:district_id => district.id,
						:region_id => region.id
					}

					lot = Lottery.find_by({:open_date => params[:open_date], :district_id => params[:district_id]})
					
					if lot.nil?
						Lottery.create(params)
					end

					result = {}
				end
			end
		end
	end
end