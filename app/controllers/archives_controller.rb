class ArchivesController < ApplicationController
  def index
    @cours = Cour.order(year: :desc, season: :desc)
  end
end
