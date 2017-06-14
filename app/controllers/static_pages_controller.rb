class StaticPagesController < ApplicationController
  def home
    @cour = Cour.current_cour
    @animes = @cour.animes.order(:api_number).page(params[:page]) unless @cour.nil?
    @watching_anime_ids = current_user.watching_anime_ids if user_signed_in?
  end
end
