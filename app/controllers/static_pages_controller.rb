class StaticPagesController < ApplicationController
  def home
    year = Date.today.year
    mon = Date.today.mon
    @cour = Cour.find_by(year: year, season: season(mon))
    @animes = @cour.animes
  end

  private

  def season(mon)
    case mon
    when 1..3
      1
    when 4..6
      2
    when 7..9
      3
    when 10..12
      3
    end
  end
end
