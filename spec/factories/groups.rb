FactoryBot.define do
  factory :group do
    sequence(:id) { |n| n }
    name { 'Easter groceries' }
    sequence(:icon) { |n| "icon-#{n}" }
    association :author, factory: :user
  end
end
