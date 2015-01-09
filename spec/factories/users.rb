FactoryGirl.define do
  factory :user do |f|
    f.f_name { Faker::Name.first_name }
		f.l_name { Faker::Name.last_name }
		f.email { Faker::Internet.email }
		f.password 'secret'
    f.password_confirmation { password }

    factory :admin do
      admin true
    end
  end

end
