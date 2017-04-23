class AnimesController < ApplicationController
  def index
    @animes = Anime.all.order(:api_number)
  end
end
