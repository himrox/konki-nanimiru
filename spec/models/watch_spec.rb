require 'rails_helper'

RSpec.describe Watch, type: :model do

  before do
    @anime = create(:anime)
    @user = create(:user)
  end

  it 'user_id,anime_idがあれば有効であること' do
    watch = Watch.new(user_id: @user.id, anime_id: @anime.id)
    expect(watch).to be_valid
  end

  it 'user_idが無ければ無効であること' do
    watch = Watch.new(anime_id: @anime.id)
    expect(watch).not_to be_valid
  end

  it 'anime_idが無ければ無効であること' do
    watch = Watch.new(user_id: @user.id)
    expect(watch).not_to be_valid
  end
end
