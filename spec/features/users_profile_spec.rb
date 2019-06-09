require 'rails_helper'

RSpec.feature "UsersProfiles", type: :feature do
  # let(:user) { FactoryBot.create(:user) }
  let(:user) { FactoryBot.create(:user) do |u|
    u.microposts.build(FactoryBot.attributes_for(:most_recent))
  end}

  # Userプロフィール画面に対するテスト
  scenario "profile display" do
    visit user_path(user)
    expect(current_path).to eq user_path(user)
    expect(page).to have_title full_title(user.name)
    expect(page).to have_selector 'h1', text: user.name

    # user.microposts.build(FactoryBot.attributes_for(:most_recent))
    # expect(page).to have_content user.microposts.count.to_s
    # first_page_of_microposts = user.microposts.paginate(page: 1)
    # first_page_of_microposts.each do |micropost|
    #   expect(page).to have_content micropost.content
    # end
  end
end
