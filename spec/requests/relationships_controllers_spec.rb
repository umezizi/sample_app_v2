require 'rails_helper'

RSpec.describe "RelationshipsControllers", type: :request do
  describe "relationship_controller" do
    it "create should require logged-in user" do
      expect {
        post relationships_path
      }.to change(Relationship, :count).by(0)
      expect(response).to redirect_to login_url
    end

    # it "destroy should require logged-in user" do
    #   expect {
    #     delete relationship_path(1)
    #   }.to change(Relationship, :count).by(0)
    #   expect(response).to redirect_to login_url
    # end
  end
end
