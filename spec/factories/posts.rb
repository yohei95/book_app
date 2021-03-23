FactoryBot.define do
  factory :post do
    title { 'testbook' }
    memo {'方法がまとめられた本です'}
    plan { '明日までに行う' }
    reference {'amazon.co.jp'}

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
