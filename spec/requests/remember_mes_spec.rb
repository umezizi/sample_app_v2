require 'rails_helper'

RSpec.describe "RememberMes", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # 2つのバグのテスト1
  context "with valid information" do
    # ログイン中のみログアウトすること
    it "logs in with valid information followed by logout" do
      sign_in_as(user)     # spec/support/utilities.rbに定義
      expect(response).to redirect_to user_path(user)

      # ログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil

      # 2番目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
    end
  end

  #リメンバーミーテスト
  context "with valid information" do
    # クッキーが入っていることを確認
    it "login with remembering" do
      log_in_as_inte(user, remember_me: '1')
      expect(response.cookies['remember_token']).to eq assigns(:user).remember_token
    end

    # クッキーが入っていないことを確認
    it "login without remembering" do
      log_in_as_inte(user, remember_me: '1')
      delete logout_path
      log_in_as_inte(user, remember_me: '0')
      expect(response.cookies['remember_token']).to eq nil
    end
  end

  # #永続的セッションのテスト
  # context "current_user returns" do
  #   # クッキーが入っていることを確認
  #   it "current_user returns right user when session is nil" do
  #     remember(user)
  #     expect(user).to eq current_user
  #     expect(user).to eq current_user
  #   end
  # end

end
