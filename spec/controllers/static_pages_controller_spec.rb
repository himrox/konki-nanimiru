require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe 'GET #home' do
    it 'homeテンプレートを表示すること' do
      year = Date.today.year
      season = (Date.today.mon / 3.0).ceil
      cour = Cour.create(year: year, season: season)
      anime = cour.animes.create(title: "テスト", api_number: 1)
      get :home
      expect(response).to render_template :home
    end
  end

end
