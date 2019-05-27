require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET user" do
    it "returns http success user" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
