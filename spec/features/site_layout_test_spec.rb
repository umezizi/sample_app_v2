require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
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

end
