require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  describe "Home page" do
    before do
      visit root_path   # 名前付きルートを使用
    end

    # HomeページにStaticPages#homeと表示されていること
    #it "should have the content 'StaticPages#home'" do
    #  expect(page).to have_content "StaticPages#home"
    #end

    # タイトルが正しく表示されていること
    it "should have the right title" do
      expect(page).to have_title full_title('')
    end
  end
end
