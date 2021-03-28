require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @post = FactoryBot.create(:post)
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのpostのmemoが存在する' do
      get post_path(@post)
      expect(response.body).to include(@post.memo)
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get post_path(@post)
      expect(response.body).to include('＜コメント一覧＞')
    end
  end
end
