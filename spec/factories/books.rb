FactoryGirl.define do
  factory :book do
    name "Rails in Action"
    isbn "5656565"
    description "Good position in Your bookcase"
    association :genre
  end
end