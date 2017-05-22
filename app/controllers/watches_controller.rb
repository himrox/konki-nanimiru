class WatchesController < ApplicationController

  before_action :authenticate_user!

  def create
    user_id = current_user.id
    anime_id = params[:anime_id]
    Watch.find_or_create_by(user_id: user_id, anime_id: anime_id)
    redirect_to root_path
  end

  def destroy
    user_id = current_user.id
    anime_id = params[:anime_id]
    watch = Watch.find_by(user_id: user_id, anime_id: anime_id)
    watch.destroy
    redirect_to root_path
  end
end
