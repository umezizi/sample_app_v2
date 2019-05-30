require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  describe "Home page" do
    before do
      visit root_path   # 名前付きルートを使用
    end

    # タイトルが正しく表示されていること
    it "should have the right title" do
      expect(page).to have_title full_title('')
    end

    # リンク確認 root
    it "should have the root link" do
      expect(page).to have_link 'Home', href: root_path
    end

    # リンク確認 help
    it "should have the link" do
      expect(page).to have_link 'Help', href: help_path
    end

    # リンク確認 about
    it "should have the link" do
      expect(page).to have_link 'About', href: about_path
    end

    # リンク確認 contact
    it "should have the link" do
      expect(page).to have_link 'Contact', href: contact_path
    end
  end

  describe "sign up page" do
    before do
      visit signup_path   # 名前付きルートを使用
    end

    # タイトルが正しく表示されていること
    it "should have the right title sign up" do
      expect(page).to have_title full_title('')
    end
  end

  describe "layout link" do

    # 演習リンクの確認
    it "layout links" do
      visit root_path   # 名前付きルートを使用
      expect(current_path).to eq root_path
      expect(page).to have_link 'Home', href: root_path
      expect(page).to have_link 'Help', href: help_path
      expect(page).to have_link 'About', href: about_path
      expect(page).to have_link 'Contact', href: contact_path
      expect(page).to have_link 'Log in', href: login_path
      visit contact_path
      expect(page).to have_title full_title('Contact')
      visit signup_path
      expect(page).to have_title full_title('Sign up')
    end

    # 演習リンク確認　ログイン時
    it "layout links when logged in" do
      visit login_path
      expect(current_path).to eq login_path
      fill_in "Email",         with: user.email
      fill_in "Password",      with: "password"
      click_button "Log in"
      visit root_path   # 名前付きルートを使用
      expect(current_path).to eq root_path
      expect(page).to have_link 'Users', href: users_path
      expect(page).to have_link 'Profile', href: user_path(user)
      expect(page).to have_link 'Settings', href: edit_user_path(user)
      expect(page).to have_link 'Log out', href: logout_path
    end
  end
end
