FactoryGirl.define do
  factory :district do |f|
    f.name { Faker::Name.name }
		f.zip { Faker::Address.zip_code }
		f.code { Faker::Address.zip_code }
  end
end
