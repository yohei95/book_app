require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }
  sleep 1.0

      describe 'フォロー・フォロワー関係' do
      context 'フォローできるとき' do
      it "follower_idとfollowed_idがあればフォローできる" do
        expect(relationship).to be_valid
      end

      it "follower_idがnilの場合、フォローできない" do
        relationship.follower_id = nil
        relationship.valid?
        expect(relationship.errors.full_messages).to include("Followerを入力してください")
      end

      it "followed_idがnilの場合、フォローできない" do
        relationship.followed_id = nil
        relationship.valid?
        expect(relationship.errors.full_messages).to include("Followedを入力してください")
      end
    end
  end
end  
