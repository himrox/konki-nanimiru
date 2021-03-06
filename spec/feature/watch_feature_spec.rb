require 'rails_helper'

RSpec.describe 'Watch feature spec', type: :feature, js: true do

  scenario 'アニメをWatch状態にする' do
    @user = create(:user)
    @anime = create(:anime)

    visit new_user_session_path
    fill_in 'ユーザー名', with: @user.username
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
    click_link 'みてない'
    visit root_path
    expect(Watch.count).to eq 1

    click_link 'みてる！'
    visit root_path
    expect(Watch.count).to eq 0
  end
end
