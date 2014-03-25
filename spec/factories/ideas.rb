FactoryGirl.define do
  factory :idea do
    name "the best idea ever"
    description "make websites that smell nice"
  end

  trait :with_picture do
    picture { fixture_file_upload(Rails.root.join('spec', 'files', 'test.png'), 'image/png')}
  end
end
