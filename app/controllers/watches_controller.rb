class WatchesController < ApplicationController

  before_action :authenticate_user!

  def index
    cour = Cour.find_by(year: params[:year], season: params[:season])
    if cour.present?
      @animes = current_user.animes.where(cour_id: cour.id)
      @watch_animes = @animes
    else
      flash[:danger] = 'そんなページないよ'
      redirect_to root_path
    end
  end

  def create
    user_id = current_user.id
    @anime_id = params[:anime_id]
    Watch.find_or_create_by(user_id: user_id, anime_id: @anime_id)
  end

  def destroy
    user_id = current_user.id
    @anime_id = params[:anime_id]
    Watch.find_by(user_id: user_id, anime_id: @anime_id).destroy
  end
end
