require 'rails_helper'

RSpec.describe WatchesController, type: :controller do

  before do
    @anime = create(:anime)
    @cour = @anime.cour
  end

  describe 'GET #index' do
    it 'ログインしている場合、indexテンプレートを表示すること' do
      login_user
      get :index, params: { year: @cour.year, season: @cour.season }
      expect(response).to render_template :index
    end

    it 'ログインしていない場合、ログインページを表示すること' do
      get :index, params: { year: @cour.year, season: @cour.season }
      expect(response).to redirect_to new_user_session_path
    end

    it '不正なパラメーターを受け取った場合、ルートページを表示すること' do
      login_user
      get :index, params: { year: 9999, season: 9 }
      expect(response).to redirect_to root_path
    end

    it '@animesにパラメーターのクールのアニメが含まれていること' do
      login_user
      Watch.create!(user_id: subject.current_user.id, anime_id: @anime.id)
      get :index, params: { year: @cour.year, season: @cour.season }
      expect(assigns(:animes)).to include(@anime)
    end
  end

  describe 'POST #create' do
    it '新しいwatchを追加すること' do
      login_user
      expect{
        post :create, params: { anime_id: @anime.id }, xhr: true
      }.to change(Watch, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'watchを削除すること' do
      login_user
      Watch.create!(user_id: subject.current_user.id, anime_id: @anime.id)
      expect{
        delete :destroy, params: { anime_id: @anime.id }, xhr: true
      }.to change(Watch, :count).by(-1)
    end
  end
end
