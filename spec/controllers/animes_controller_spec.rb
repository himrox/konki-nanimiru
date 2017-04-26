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
      animes = Anime.all.order(api_number: :desc)
      get :index
      expect(assigns(:animes)).to eq(animes)
    end
  end

  describe 'GET #edit' do
    before do
      @anime = create(:anime)
      get :edit, params: { id: @anime }
    end

    it '@animeに要求されたアニメの値を割り当てること' do
      expect(assigns(:anime)).to eq(@anime)
    end

    it 'editテンプレートを表示すること' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before do
      @anime = create(:anime)
    end

    it '@animeに要求されたアニメの値を割り当てること' do
      patch :update, params: { id: @anime, anime: attributes_for(:anime) }
      expect(assigns(:anime)).to eq(@anime)
    end

    context '有効な属性の場合' do
      before do
        patch :update, params: {
          id: @anime,
          anime: attributes_for(:anime, img_url: 'http://example.com')
        }
      end

      it '@animeの内容を変更しないこと' do
        @anime.reload
        expect(@anime.img_url).to eq('http://example.com')
      end

      it 'indexにリダイレクトされること' do
        expect(response).to redirect_to animes_path
      end
    end

    context '無効な属性の場合' do
      before do
        patch :update, params: {
          id: @anime,
          anime: attributes_for(:anime, img_url: 'hoge@example.com')
        }
      end

      it '@animeの内容を変更すること' do
        @anime.reload
        expect(@anime.img_url).not_to eq('hoge@example.com')
      end

      it 'editテンプレートを表示すること' do
        expect(response).to render_template :edit
      end
    end
  end
end
