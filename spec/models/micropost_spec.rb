require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:micropost) { user.microposts.build(content: "Lorem ipsum") }
  let(:most_recent) { FactoryBot.create(:most_recent) }


  describe Micropost do
    it "should be valid" do
      expect(micropost).to be_valid
    end

    it "user id should be present" do
      micropost.user_id = nil
      expect(micropost).to_not be_valid
    end

    it "content should be present" do
      micropost.content = " "
      expect(micropost).to_not be_valid
    end

    it "content should be at most 140 characters" do
      micropost.content = "a" * 141
      expect(micropost).to_not be_valid
    end

    it "order should be most recent first" do
      expect(most_recent).to eq Micropost.first
    end
  end
end
