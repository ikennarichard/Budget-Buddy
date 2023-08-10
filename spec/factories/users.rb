FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    name { 'Frankie' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'pass-1' }
  end
end
