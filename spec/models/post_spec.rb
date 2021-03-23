require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    sleep 1.0
  end

  describe '投稿' do
    context '新規投稿できるとき' do
      it 'title、memo、plan、reference、画像が存在すれば投稿できる' do
        expect(@post).to be_valid
      end
      it 'memoは空でも投稿できる' do
        @post.memo=''
        expect(@post).to be_valid
      end
      it 'referenceは空でも投稿できる' do
        @post.reference=''
        expect(@post).to be_valid
      end
      it '画像は空でも投稿できる' do
        @post.image=nil
        expect(@post).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Titleを入力してください')
      end
      it 'planが空では投稿できない' do
        @post.plan = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Planを入力してください')
      end
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('Userを入力してください')
    end
  end
end
