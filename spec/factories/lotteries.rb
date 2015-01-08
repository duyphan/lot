require 'faker'

FactoryGirl.define do
  factory :lottery do |f|
    f.open_date "2015-01-07 03:26:45"
		f.special { Faker::Number.number(6) }
		f.first { Faker::Number.number(5) }
		f.second { Faker::Number.number(5) }
		f.third { Faker::Number.number(5) }
		f.fourth { Faker::Number.number(5) }
		f.fifth { Faker::Number.number(4) }
		f.sixth { Faker::Number.number(4) }
		f.seventh { Faker::Number.number(3) }
		f.eighth { Faker::Number.number(2) }

		f.association :district
  end
end