require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:post)
    @like = FactoryBot.build(:like, user_id: user.id, post_id: item.id)
    sleep 0.1
  end

  describe 'いいね' do
    context 'いいねできるとき' do
      it 'user_id、post_idが存在すればいいねできる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねできないとき' do
      it 'user_idがnilでは投稿できない' do
        @like.user_id = ''
        @like.valid?
        expect(@like.errors.full_messages).to include('Userを入力してください')
      end
    it 'post_idがnilでは投稿できない' do
      @like.post_id = nil
      @like.valid?
      expect(@like.errors.full_messages).to include('Postを入力してください')
    end
  end
  end
end