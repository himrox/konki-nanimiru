class StaticPagesController < ApplicationController
  def home
    @cour = current_cour
    @animes = @cour.animes.order(:api_number) unless @cour.nil?
    @watch_animes = current_user.animes if user_signed_in?
  end
end
