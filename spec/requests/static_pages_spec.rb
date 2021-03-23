require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
