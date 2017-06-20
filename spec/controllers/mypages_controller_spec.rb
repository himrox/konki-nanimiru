require 'rails_helper'

RSpec.describe MypagesController, type: :controller do
  describe 'GET #show' do
    it 'showテンプレートを表示すること' do
      user = create(:user)
      get :show, params: { username: user.username }
      expect(response).to render_template :show
    end
  end
end
