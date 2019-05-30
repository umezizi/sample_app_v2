require 'rails_helper'

RSpec.feature "UsersIndices", type: :feature do
  let(:admin)     { FactoryBot.create(:user) }
  let(:non_admin) { FactoryBot.create(:archer) }

  # ページネーションを含めたUsersIndexのテスト
  scenario "index as admin including pagination and delete links" do
    visit login_path
    expect(current_path).to eq login_path
    fill_in "Email",         with: admin.email
    fill_in "Password",      with: "password"
    click_button "Log in"
    expect(current_path).to eq user_path(admin)
    visit users_path
    expect(current_path).to eq users_path
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      expect(page).to have_link user.name, href: user_path(user)
      unless user == admin
        expect(page).to have_link 'delete', href: user_path(user)
      end
    end
    # expect {
    #   # click_on 'delete'
    #   delete user_path(non_admin)
    # }.to change(User, :count).by(-1)
  end

  # アカウントの違うユーザーの場合
  scenario "index as non-admin" do
    visit login_path
    expect(current_path).to eq login_path
    fill_in "Email",         with: non_admin.email
    fill_in "Password",      with: "password"
    click_button "Log in"
    expect(current_path).to eq user_path(non_admin)
    visit users_path
    expect(current_path).to eq users_path
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      expect(page).to have_link user.name, href: user_path(user)
      unless user == admin
        expect(page).to_not have_link 'delete', href: user_path(user)
      end
    end
    # expect {
    #   # click_on 'delete'
    #   delete user_path(non_admin)
    # }.to change(User, :count).by(-1)
  end


end
