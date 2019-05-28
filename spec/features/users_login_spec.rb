require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  # フラッシュメッセージの残留をキャッチする
  scenario "login with invalid information" do
    visit login_path
    expect(current_path).to eq login_path
    fill_in "Email",         with: ""
    fill_in "Password",      with: ""
    click_button "Log in"
    expect(current_path).to eq login_path
    expect(page).to have_selector 'div.alert-danger'
    visit root_path
    expect(page).to_not have_selector 'div.alert-danger'
  end

  # フラッシュメッセージの残留をキャッチする
  scenario "login with valid information followed by logout" do
    visit login_path
    expect(current_path).to eq login_path
    fill_in "Email",         with: user.email
    fill_in "Password",      with: "password"
    click_button "Log in"
    expect(current_path).to eq user_path(user)
    expect(page).to_not have_link 'Log in',  href: login_path
    expect(page).to     have_link 'Log out',  href: logout_path
    expect(page).to     have_link 'Profile', href: user_path(user)
    click_link "Log out"
    expect(current_path).to eq root_path
    expect(page).to     have_link 'Log in',  href: login_path
    expect(page).to_not have_link 'Log out',  href: logout_path
    expect(page).to_not have_link 'Profile', href: user_path(user)
  end

end
