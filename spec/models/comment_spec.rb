require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント' do
    context 'コメントできるとき' do
      it 'textが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
  end
end
