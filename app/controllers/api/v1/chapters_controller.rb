class Api::V1::ChaptersController < Api::V1::BaseController
  def index
    @chapters = Chapter.all
  end

  def show
end
