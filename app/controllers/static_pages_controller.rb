class StaticPagesController < ApplicationController
  def home
    @animes = current_cour.animes.order(:api_number) unless current_cour.nil?
    @watch_animes = current_user.animes if user_signed_in?
  end
end
