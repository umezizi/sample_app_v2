require 'rails_helper'

RSpec.feature "MicropostsInterfaces", type: :feature do
  let(:user) { FactoryBot.create(:user) do |u|
    u.microposts.build(FactoryBot.attributes_for(:most_recent))
  end}

  scenario "micropost interface" do
    visit login_path
    expect(current_path).to eq login_path
    fill_in "Email",         with: user.email
    fill_in "Password",      with: "password"
    click_button "Log in"
    expect(current_path).to eq user_path(user)
    visit root_path
    expect(current_path).to eq root_path
    # expect(page).to have_selector 'div.pagination'
    
    expect {
      fill_in "Compose new micropost...", with:""
      click_button "Post"
    }.to change(Micropost, :count).by(0)
    visit root_path

    expect {
      fill_in "Compose new micropost...", with:"This micropost reall"
      click_button "Post"
    }.to change(Micropost, :count).by(1)
    
    expect(current_path).to eq root_path
    expect(page).to have_content "This micropost reall"
    expect(page).to have_content "delete"

    expect {
      click_link "delete"
    }.to change(Micropost, :count).by(-1)

  end

end
