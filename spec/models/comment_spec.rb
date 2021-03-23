require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント' do
    context 'コメント投稿できるとき' do
      it 'textが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できないとき' do
      it 'textが空では投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textを入力してください')
      end

      it '内容が50文字以内でないと投稿できない' do
        @comment.text = 'あ' * 51
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textは50文字以内で入力してください')
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end

      it 'Post（投稿）が紐付いていなければ投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Postを入力してください')
      end
    end
  end
end
