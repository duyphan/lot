FactoryGirl.define do
  factory :article do
  	association :user
    title { Faker::Lorem.sentence }
		description { Faker::Lorem.paragraph }
		a_type { Faker::Lorem.word }

		factory :invalid_article do
      title nil
    end
  end
end
