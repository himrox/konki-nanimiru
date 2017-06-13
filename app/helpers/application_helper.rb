module ApplicationHelper
  # 現在のクールを返す
  def current_cour
    year = Date.today.year
    mon = Date.today.mon
    Cour.find_by(year: year, season: season(mon))
  end

  # 与えられた月の季節を表す数値を返す
  # 1-3月   => 1(冬)
  # 4-6月   => 2(春)
  # 7-9月   => 3(夏)
  # 10-12月 => 4(秋)
  def season(mon)
    (mon / 3.0).ceil
  end

  # 与えられたユーザーが見ているアニメのidの配列を返す
  def watching_anime_ids(user)
    ids = []
    user.animes.each do |anime|
      ids << anime.id
    end
    ids
  end
end
