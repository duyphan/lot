require 'faker'

FactoryGirl.define do 
	factory :region do |f| 
		f.name { Faker::Name.name }
		f.portal_code { Faker::Address.zip_code }
	end 
end