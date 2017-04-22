class CoursController < ApplicationController
  def index
    @cours = Cour.all.order(:year, :season)
  end
end
