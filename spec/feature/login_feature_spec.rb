require 'rails_helper'

RSpec.describe 'Login feature spec', type: :feature do

  before do
    @user = FactoryGirl.create(:user)
  end

  scenario '正しい情報を入力したら、ログインされること' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
    expect(current_path).to eq root_path
    expect(page).to have_link 'ログアウト', href: destroy_user_session_path
    click_link 'ログアウト'
    expect(page).to have_link 'ログイン', href: new_user_session_path
  end

  scenario '不正な情報を入力したら、ログインされないこと' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: 'hogefuga'
    click_button 'ログイン'
    expect(current_path).to eq new_user_session_path
    expect(page).not_to have_link 'ログアウト', href: destroy_user_session_path
  end
end
