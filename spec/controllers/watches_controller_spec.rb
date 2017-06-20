require 'rails_helper'

RSpec.describe WatchesController, type: :controller do
  before do
    @anime = create(:anime)
    @cour = @anime.cour
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
