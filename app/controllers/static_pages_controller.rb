class StaticPagesController < ApplicationController
  def home
    @cour = current_cour
    @animes = @cour.animes.order(:api_number) unless @cour.nil?
    @watching_anime_ids = watching_anime_ids(current_user) if user_signed_in?
  end
end
