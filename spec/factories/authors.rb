FactoryGirl.define do
  factory :author do
    first_name "Matt"
    last_name "Zandsta"
    factory :author_with_books do

      after(:create) do |author|
        FactoryGirl.create(:book, author: author)
      end
    end
  end
end