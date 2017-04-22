require 'rails_helper'

RSpec.describe CoursController, type: :controller do

  describe 'GET #index' do
    it 'Indexテンプレートを表示すること' do
      get :index
      expect(response).to render_template :index
    end

    it '全てのクールを配列にまとめること' do
      (1..4).each do |i|
        create(:cour, season: i)
      end
      cours = Cour.all.order(:year, :season)
      get :index
      expect(assigns(:cours)).to eq(cours)
    end
  end

end
