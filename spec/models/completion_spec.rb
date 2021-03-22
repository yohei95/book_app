require 'rails_helper'
RSpec.describe Completion, type: :model do
  before do
    @completion = FactoryBot.build(:completion)
  end

  describe 'プラン完了' do
    context 'プラン完了できるとき' do
      it 'user_id、post_idが存在すれば完了できる' do
        expect(@completion).to be_valid
      end
    end
  end
end