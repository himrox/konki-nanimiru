require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe 'GET #home' do
    it 'homeテンプレートを表示すること' do
      get :home
      expect(response).to render_template :home
    end
  end

end
