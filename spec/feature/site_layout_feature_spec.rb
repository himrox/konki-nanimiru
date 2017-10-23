require 'rails_helper'

RSpec.describe 'Site Layout feature spec', type: :feature do

  before do
    @user = FactoryGirl.create(:user)
    @anime = FactoryGirl.create(:anime)
  end

  scenario 'ログアウトしている場合' do
    visit root_path
    expect(page).to have_link 'アカウントを作る', href: new_user_registration_path
    expect(page).not_to have_link 'ウォッチリスト'
    expect(page).not_to have_link 'みてる！'
    expect(page).not_to have_link 'アカウント設定', href: edit_user_registration_path
  end

  scenario 'ログインしている場合' do
    visit new_user_session_path
    fill_in 'ユーザー名', with: @user.username
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    visit root_path
    expect(page).not_to have_link 'アカウントを作る', href: new_user_registration_path
    expect(page).to have_link 'みてない'
    expect(page).to have_link 'アカウント設定', href: edit_user_registration_path
  end
end
