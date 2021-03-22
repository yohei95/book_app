require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿' do
    context '新規投稿できるとき' do
      it 'title、planが存在すれば投稿できる' do
        expect(@post).to be_valid
      end
    end
  end
end
