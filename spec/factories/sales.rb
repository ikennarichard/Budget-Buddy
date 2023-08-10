FactoryBot.define do
  factory :sale do
    sequence(:id) { |n| n }
    name { 'Easter groceries' }
    amount { 10 }
    association :author, factory: :user
    association :group, factory: :group
  end
end
