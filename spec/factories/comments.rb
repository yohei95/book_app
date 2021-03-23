FactoryBot.define do
  factory :comment do
    text { 'testtext' }
    association :user
    association :post
  end
end
