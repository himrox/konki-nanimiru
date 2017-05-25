require 'rails_helper'

RSpec.describe AnimesController, type: :controller do

  describe 'GET #index' do
    before do
      @anime = create(:anime)
      cour = @anime.cour
      get :index, params: { year: cour.year, season: cour.season }
    end

    it 'indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end

    it '@animesに要求されたクールのアニメが含まれていること' do
      expect(assigns(:animes)).to include(@anime)
    end

    it '不正なパラメーターを受け取った場合ルートにリダイレクトされる' do
      get :index, params: { year: 2999, season: 9 }
      expect(response).to redirect_to root_path
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

      it 'rootにリダイレクトされること' do
        expect(response).to redirect_to root_path
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
