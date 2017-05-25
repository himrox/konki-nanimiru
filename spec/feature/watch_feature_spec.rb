require 'rails_helper'

RSpec.describe 'Watch feature spec', type: :feature do

  before do
    @user = create(:user)
    @anime = create(:anime)

    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
  end

  # scenario 'アニメをWatch状態にする' do
  #   visit root_path
  #   expect(page).to have_link 'Watch'
  #   expect(page).not_to have_link 'UnWatch'
  #   expect(click_link 'Watch').to change(Watch, :count).by(1)
  # end
end
