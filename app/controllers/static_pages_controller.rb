class StaticPagesController < ApplicationController
  def home
    year = Date.today.year
    mon = Date.today.mon
    cour = Cour.find_by(year: year, season: season(mon))
    @animes = cour.animes.order(:api_number) unless cour.nil?
  end

  private

  def season(mon)
    (mon / 3.0).ceil
  end
end
