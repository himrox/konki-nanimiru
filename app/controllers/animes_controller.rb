class AnimesController < ApplicationController
  def index
    @animes = Anime.all.order(api_number: :desc).includes(:cour)
  end

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])

    if @anime.update_attributes(anime_params)
      flash[:success] = '更新しました'
      redirect_to animes_path
    else
      render 'edit'
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:public_url, :img_url, :story)
  end
end
