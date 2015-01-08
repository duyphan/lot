require 'faker'

FactoryGirl.define do
  factory :district do |f|
    f.name { Faker::Name.name }
		f.zip { Faker::Address.zip }
		f.code { Faker::Address.zip_code }

		f.association :region
  end
end
