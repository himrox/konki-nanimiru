require 'rails_helper'

RSpec.describe AnimesController, type: :controller do
  describe 'GET #index' do
    it 'Indexテンプレートを表示すること' do
      get :index
      expect(response).to render_template :index
    end

    it '全てのAnimeを配列にまとめること' do
      cour = create(:cour)
      (1..10).each do |i|
        cour.animes.create(title: "テスト#{i}", api_number: i)
      end
      animes = Anime.all.order(:api_number)
      get :index
      expect(assigns(:animes)).to eq(animes)
    end
  end
end
