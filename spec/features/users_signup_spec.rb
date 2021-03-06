require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do

  # 無効な情報ではログインに失敗すること
  scenario "invalid signup information"do
    ActionMailer::Base.deliveries.clear
    visit signup_path
    expect {
      fill_in "Name",          with: ""
      fill_in "Email",         with: "user@invalid"
      fill_in "Password",      with: "foo"
      fill_in "Password confirmation",  with: "bar"
      click_button "Create my account"
    }.to change(User, :count).by(0)
    expect(current_path).to eq signup_path
    expect(page).to have_selector 'div#error_explanation'
    expect(page).to have_selector 'div.alert'
  end

  # 有効な情報ではログインに成功すること
  scenario "valid signup information with account activation" do
    ActionMailer::Base.deliveries.clear
    visit signup_path
    expect {
      fill_in "Name",          with: "Example User"
      fill_in "Email",         with: "user@example.com"
      fill_in "Password",      with: "password"
      fill_in "Password confirmation",  with: "password"
      click_button "Create my account"
    }.to change(User, :count).by(1)
    # user = User.find_by(email:"user@example.com")
    # expect(current_path).to eq user_path(user)
    # expect(page).to have_selector 'div.alert-success'
  end
end
