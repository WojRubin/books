FactoryGirl.define do
  factory :book do
    genre "Science"
    sequence(:author){|n| "#{n}author"}
  end
end