require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  let(:user)       { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:archer) }

  # editとupdateアクションの保護に対するテストする
  context "#edit" do
    it "should redirect edit when not logged in" do
      get edit_user_path(user)
      expect(response).to redirect_to login_url
      #expect(response.body).to include "Please log in."
    end

    it "should redirect update when not logged in" do
      patch user_path(user), params: { user: { name: user.name,
                                               email: user.email } }
      expect(response).to redirect_to login_url
      #expect(response.body).to include "Please log in."
    end

    it "should not allow the admin attribute to be edited via the web" do
      log_in_as_inte(other_user)
      expect(false).to eq other_user.admin?
      patch user_path(other_user), params: { user: { password: other_user.password,
                                                     email: other_user.password,
                                                     admin: true } }
      expect(false).to eq other_user.reload.admin?
    end

    it "should redirect edit when logged in as wrong user" do
      log_in_as_inte(other_user)
      get edit_user_path(user)
      expect(response).to redirect_to root_url
      #expect(response.body).to include "Please log in."
    end

    it "should redirect update when logged in as wrong user" do
      log_in_as_inte(other_user)
      patch user_path(user), params: { user: { name: user.name,
                                               email: user.email } }
      expect(response).to redirect_to root_url
      #expect(response.body).to include "Please log in."
    end

    it "should redirect index when not logged in" do
      get users_path
      expect(response).to redirect_to login_url
    end
  end

    context "#destroy" do
      it "should redirect destroy when not logged in" do
        #expect {
          delete user_path(user)
        #}.to change(User, :count).by(0)
        expect(response).to redirect_to login_url
      end

      it "should redirect destroy when logged in as a non-admin" do
        log_in_as_inte(other_user)
        #expect {
          delete user_path(user)
        #}.to change(User, :count).by(0)
        expect(response).to redirect_to root_url
      end

    # 認可されたユーザーとして
    context "as an authorized user" do
      # ユーザーを削除できること
      it "deletes a user" do
        log_in_as_inte(user)
        expect {
          delete user_path(user), params: { id: user.id }
        }.to change(User, :count).by(-1)
      end
    end

    # アカウントの違うユーザーの場合
    context "as au unauthorized user" do
      # ホーム画面にリダイレクトすること
      it "redirects to the dashboard" do
        log_in_as_inte(other_user)
        delete user_path(user), params: { id: user.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end
