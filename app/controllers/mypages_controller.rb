class MypagesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @animes = @user.animes.where(cour_id: Cour.current_cour.id)
  end
end
