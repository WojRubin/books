FactoryGirl.define do
  factory :genre do
    name "Programming Books"
    factory :genre_with_books do

      ignore do
        books_count 1
      end

      after(:create) do |genre, evaluator|
        FactoryGirl.create_list(:book, evaluator.books_count, genre: genre)
      end
    end
  end
end