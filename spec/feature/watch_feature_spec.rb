require 'rails_helper'

RSpec.describe 'Watch feature spec', type: :feature, js: true do

  scenario 'アニメをWatch状態にする' do
    @user = create(:user)
    @anime = create(:anime)

    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
    click_link 'UnWatch'
    visit root_path
    expect(Watch.count).to eq 1

    click_link 'Watch'
    visit root_path
    expect(Watch.count).to eq 0
  end
end
