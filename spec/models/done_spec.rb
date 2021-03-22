require 'rails_helper'
RSpec.describe Done, type: :model do
  before do
    @done = FactoryBot.build(:done)
  end

  describe 'プラン完了' do
    context 'プラン完了できるとき' do
      it 'user_id、post_idが存在すれば完了できる' do
        expect(@done).to be_valid
      end
    end
  end
end
