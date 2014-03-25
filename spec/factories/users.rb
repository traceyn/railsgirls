FactoryGirl.define do
  factory :user do
    # sequence(:first_name){ |n| Faker::Name.first_name }
    # sequence(:last_name) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password "password1"
  end
end
