require 'rails_helper'
RSpec.describe Completion, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:post)
    @completion = FactoryBot.build(:completion, user_id: user.id, post_id: item.id)
    sleep(1)
  end

  describe 'プラン完了' do
    context 'プラン完了できるとき' do
      it 'user_id、post_idが存在すれば完了できる' do
        expect(@completion).to be_valid
      end
    end

    context 'プラン完了できないとき' do
      it 'user_idがnilでは完了できない' do
        @completion.user_id = nil
        @completion.valid?
        expect(@completion.errors.full_messages).to include('Userを入力してください')
      end
      it 'post_idがnilでは投稿できない' do
        @completion.post_id = nil
        @completion.valid?
        expect(@completion.errors.full_messages).to include('Postを入力してください')
      end
    end
  end
end
