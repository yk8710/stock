FactoryBot.define do
  factory :post do
    association :user

    name              { Faker::Commerce.product_name }
    quantity          { Faker::Number.digit }
    category_id       { Faker::Number.between(from: 1, to: 10) }
    best_before       { Faker::Date.between(from: Date.today, to: '2025-01-01') }
    location          { Faker::House.room }
  end
end
