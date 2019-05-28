require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Sessions Controllrt test" do
    render_views

    it "should get new" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
