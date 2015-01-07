FactoryGirl.define do
  factory :district do
    name { Faker::Name.name }
		zip { Faker::Address.zip }
		code { Faker::Address.zip_code }
  end
end
