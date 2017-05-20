require 'rails_helper'

RSpec.describe 'Signup feature spec', type: :feature do

  scenario '正しい情報を入力したら、ユーザー登録されること' do
    user = FactoryGirl.build(:user)
    expect{
      visit new_user_registration_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      fill_in 'パスワード(確認用)', with: user.password_confirmation
      click_button 'アカウント登録'
    }.to change(User, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_link 'ログアウト', href: destroy_user_session_path
  end

  scenario '不正な情報を入力したら、ユーザー登録されないこと' do
    user = FactoryGirl.build(:user)
    user.email = '   '
    expect{
      visit new_user_registration_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      fill_in 'パスワード(確認用)', with: user.password_confirmation
      click_button 'アカウント登録'
    }.not_to change(User, :count)
    expect(page).not_to have_link 'ログアウト', href: destroy_user_session_path
  end
end
