# == Schema Information
#
# Table name: cours
#
#  id         :integer          not null, primary key
#  year       :integer
#  season     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cours_on_year_and_season  (year,season) UNIQUE
#

require 'rails_helper'

RSpec.describe Cour, type: :model do
  before do
    @cour = build(:cour)
  end

  context '有効な場合' do
    it 'year, seasonがある' do
      expect(@cour).to be_valid
    end

    it 'yearが2000以上' do
      @cour.year = 2000
      expect(@cour).to be_valid
    end

    it 'yearが2030以下' do
      @cour.year = 2030
      expect(@cour).to be_valid
    end

    it 'seasonが1〜4' do
      (1..4).each do |i|
        @cour.season = i
        expect(@cour).to be_valid
      end
    end
  end

  context '無効な場合' do
    it 'yearがない' do
      @cour.year = nil
      expect(@cour).not_to be_valid
    end

    it 'seasonがない' do
      @cour.season = nil
      expect(@cour).not_to be_valid
    end

    it 'yearが1999以下' do
      @cour.year = 1999
      expect(@cour).not_to be_valid
    end

    it 'yearが2031以上' do
      @cour.year = 2031
      expect(@cour).not_to be_valid
    end

    it 'seasonが5以上' do
      @cour.season = 5
      expect(@cour).not_to be_valid
    end

    it 'yearとseasonの組み合わせが一意でない' do
      dup_cour = @cour.dup
      @cour.save
      expect(dup_cour).not_to be_valid
    end
  end

  it '#season_nameメソッドが季節の日本語名を返すこと' do
    cour = Cour.new(year: 2017, season: 1)
    expect(cour.season_name).to eq '冬'
    cour = Cour.new(year: 2017, season: 2)
    expect(cour.season_name).to eq '春'
    cour = Cour.new(year: 2017, season: 3)
    expect(cour.season_name).to eq '夏'
    cour = Cour.new(year: 2017, season: 4)
    expect(cour.season_name).to eq '秋'
  end

  it "twitterボタンのリンクを返すこと" do
    url = "http://twitter.com/intent/tweet?text=" +
      "今期なに見る？で#{@cour.year}年#{@cour.season_name}アニメをチェック！" +
      "&hashtags=#{@cour.year}年#{@cour.season_name}アニメ,今期なに見る？"
    expect(@cour.tweet_btn_uri).to eq url
  end
end
