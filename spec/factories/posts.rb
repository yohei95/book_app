FactoryBot.define do
  factory :post do
    title { 'testbook' }
    plan { '明日までに行う' }

    association :user
  end
end
