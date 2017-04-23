# == Schema Information
#
# Table name: animes
#
#  id         :integer          not null, primary key
#  title      :string
#  public_url :string
#  cour_id    :integer
#  api_number :integer
#  story      :text
#  img_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Anime, type: :model do
  before do
    @anime = build(:anime)
  end

  context '有効な場合' do
    it 'title, api_number, cour_idがある' do
      expect(@anime).to be_valid
    end

    it 'public_urlが正しい形式である' do
      urls = %w(
        https://example.com/example.img
        http://example.com/example.img
        http://サンプル.com/example.img
      )
      urls.each do |url|
        @anime.public_url = url
        expect(@anime).to be_valid
      end
    end

    it 'titleが200文字以内である' do
      title = 'a' * 200
      @anime.title = title
      expect(@anime).to be_valid
    end

    it 'public_urlが2000文字以内である' do
      public_url = 'http://' + 'a' * 1993
      @anime.public_url = public_url
      expect(@anime).to be_valid
    end

    it 'img_urlが2000文字以内である' do
      img_url = 'http://' + 'a' * 1993
      @anime.img_url = img_url
      expect(@anime).to be_valid
    end

    it 'img_urlが正しい形式である' do
      urls = %w(
        https://example.com/example.img
        http://example.com/example.img
        http://サンプル.com/example.img
      )
      urls.each do |url|
        @anime.img_url = url
        expect(@anime).to be_valid
      end
    end

    it 'storyが1000文字以内である' do
      story = 'a' * 1000
      @anime.story = story
      expect(@anime).to be_valid
    end

    it 'courが削除されたら関連するanimeも削除されること' do
      cour = Cour.create!(year: 2020, season: 1)
      anime = cour.animes.create!(title: 'テスト', api_number: 1)
      expect(cour.animes).not_to be_empty
      cour.destroy
      expect(cour.animes).to be_empty
    end
  end

  context '無効な場合' do
    it 'titleがない' do
      @anime.title = nil
      expect(@anime).not_to be_valid
    end

    it 'api_numberがない' do
      @anime.api_number = nil
      expect(@anime).not_to be_valid
    end

    it 'cour_idがない' do
      @anime.cour_id = nil
      expect(@anime).not_to be_valid
    end

    it 'public_urlが不正な形式である' do
      urls = %w(
        ftp://example.com/example.img
        git@example.com:example.img
        example@example.com
      )
      urls.each do |url|
        @anime.public_url = url
        expect(@anime).not_to be_valid
      end
    end

    it 'titleが201文字以上である' do
      title = 'a' * 201
      @anime.title = title
      expect(@anime).not_to be_valid
    end

    it 'public_urlが2001文字以上である' do
      public_url = 'http://' + 'a' * 1994
      @anime.public_url = public_url
      expect(@anime).not_to be_valid
    end

    it 'img_urlが2001文字以上である' do
      img_url = 'http://' + 'a' * 1994
      @anime.img_url = img_url
      expect(@anime).not_to be_valid
    end

    it 'img_urlが不正な形式である' do
      urls = %w(
        ftp://example.com/example.img
        git@example.com:example.img
        example@example.com
      )
      urls.each do |url|
        @anime.img_url = url
        expect(@anime).not_to be_valid
      end
    end

    it 'storyが1001文字以上である' do
      story = 'a' * 1001
      @anime.story = story
      expect(@anime).not_to be_valid
    end

    it 'cour_idとtitleの組み合わせが一意でない' do
      dup_anime = @anime.dup
      @anime.save
      expect(dup_anime).not_to be_valid
    end
  end
end
