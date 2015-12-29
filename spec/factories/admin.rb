FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n|  "#{n}@here.com" }
    password "abc123"
  end
end
