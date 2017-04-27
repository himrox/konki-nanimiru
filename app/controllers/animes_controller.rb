class AnimesController < ApplicationController
  def index
    cour = Cour.find_by(year: params[:year], season: params[:season])
    @animes = cour.animes
  end

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])

    if @anime.update_attributes(anime_params)
      flash[:success] = '更新しました'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:public_url, :img_url, :story)
  end
end
