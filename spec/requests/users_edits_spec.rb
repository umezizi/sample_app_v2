require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # 編集のテスト
  context "#edit" do
    # 編集失敗に対するテスト
    it "unsuccessful edit" do
      log_in_as_inte(user)
      get edit_user_path(user)
      expect(response).to render_template :edit
      patch user_path(user), params: { user: { name:  "",
                                               email: "foo@invalid",
                                               password:              "foo",
                                               password_confirmation: "bar" } }
      expect(response).to render_template :edit
      expect(response.body).to include "The form contains 4 errors."
    end

    # 編集成功に対するテスト
    it "successful edit with friendly forwarding" do
      get edit_user_path(user)
      log_in_as_inte(user)
      expect(response).to redirect_to edit_user_path(user)
      expect(session[:forwarding_url]).to eq nil
      # expect(response).to render_template :edit
      name  = "Foo Bar"
      email = "foo@bar.com"
      patch user_path(user), params: { user: { name:  name,
                                               email: email,
                                               password:              "",
                                               password_confirmation: "" } }
      expect(response).to redirect_to user_path(user)
      #expect(response.body).to include "Profile updated"
      user.reload
      expect(name).to  eq user.name
      expect(email).to eq user.email

    end
  end
end
