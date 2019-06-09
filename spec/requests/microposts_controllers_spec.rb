require 'rails_helper'

RSpec.describe "MicropostsControllers", type: :request do
  # let(:user)       { FactoryBot.create(:user) }
  let(:other_user)       { FactoryBot.create(:archer) }
  let(:user) { FactoryBot.create(:user) do |u|
    u.microposts.build(FactoryBot.attributes_for(:most_recent))
  end}
  # let(:micropost) { FactoryBot.create(:most_recent) }

  describe "micropost_controller" do
    it "should redirect create when not logged in" do
      micropost =  FactoryBot.create(:most_recent)
      expect {
        post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
      }.to change(Micropost, :count).by(0)
      expect(response).to redirect_to login_url
    end

    it "should redirect destroy when not logged in" do
      micropost =  FactoryBot.create(:most_recent)
      expect {
        delete micropost_path(micropost)
      }.to change(Micropost, :count).by(0)
      expect(response).to redirect_to login_url
    end

    it "should redirect destroy for wrong micropost" do
      log_in_as_inte(other_user)
      micropost =  FactoryBot.create(:most_recent)
      expect {
        delete micropost_path(micropost)
      }.to change(Micropost, :count).by(0)
      expect(response).to redirect_to root_url
    end

    it "micropost sidebar count" do
      log_in_as_inte(user)
      get root_path
      expect(response.body).to include "#{user.microposts.count} microposts"
      log_in_as_inte(other_user)
      get root_path
      expect(response.body).to include "0 microposts"
      other_user.microposts.create!(content: "A micropost")
      get root_path
      expect(response.body).to include "1 micropost"
    end
  end
end
