FactoryBot.define do
  factory :post do
    title { 'testbook' }

    association :user
  end
end
