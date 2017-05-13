require 'rails_helper'

RSpec.describe 'Signup feature spec', type: :feature do

  scenario '正しい情報を入力したら、ユーザー登録されること' do
    user = FactoryGirl.build(:user)
    expect{
      visit new_user_registration_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_link 'ログアウト', href: destroy_user_session_path
  end

  scenario '不正な情報を入力したら、ユーザー登録されないこと' do
    user = FactoryGirl.build(:user)
    user.email = '   '
    expect{
      visit new_user_registration_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
    }.not_to change(User, :count)
    expect(page).not_to have_link 'ログアウト', href: destroy_user_session_path
  end
end
