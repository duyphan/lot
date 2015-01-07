require 'faker'
FactoryGirl.define do
  factory :lottery do
    open_date "2015-01-07 03:26:45"
		special { Faker::Number.number(6) }
		first { Faker::Number.number(5) }
		second { Faker::Number.number(5) }
		third { Faker::Number.number(5) }
		fourth { Faker::Number.number(5) }
		fifth { Faker::Number.number(4) }
		sixth { Faker::Number.number(4) }
		seventh { Faker::Number.number(3) }
		eighth { Faker::Number.number(2) }
  end
end
