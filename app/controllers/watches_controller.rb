class WatchesController < ApplicationController

  before_action :authenticate_user!

  def create
    user_id = current_user.id
    @anime_id = params[:anime_id]
    Watch.find_or_create_by(user_id: user_id, anime_id: @anime_id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    user_id = current_user.id
    @anime_id = params[:anime_id]
    watch = Watch.find_by(user_id: user_id, anime_id: @anime_id)
    watch.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
end
