require 'rails_helper'

RSpec.describe "Followings", type: :request do
  let(:user)       { FactoryBot.create(:user) }
  let(:other)      { FactoryBot.create(:archer) }

  # describe "following" do
  #   it "should follow a user the standard way" do
  #     expect {
  #       post relationships_path, params: { followed_id: other.id }
  #     }.to change(Following, :count).by(1)
  #   end
  # end
end
