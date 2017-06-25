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

class Cour < ApplicationRecord
  has_many :animes, dependent: :destroy

  validates :year, presence: true,
                   numericality: { only_integer: true,
                                   greater_than_or_equal_to: 2000,
                                   less_than_or_equal_to: 2030 },
                   uniqueness: { scope: [:season] }
  validates :season, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 4 }

  # 現在のクールを返す
  def self.current_cour
    year   = Date.today.year
    mon    = Date.today.mon
    season = (mon / 3.0).ceil
    Cour.find_by(year: year, season: season)
  end

  # 季節の日本語名を返す
  def season_name
    season_names = { 1 => '冬', 2 => '春', 3 => '夏', 4 => '秋' }
    season_names[self.season]
  end

  def tweet_btn_uri
    "http://twitter.com/intent/tweet?text=" +
    "今期なに見る？で#{self.year}年#{self.season_name}アニメをチェック！" +
    "&hashtags=#{self.year}年#{self.season_name}アニメ,今期なに見る？"
  end
end
