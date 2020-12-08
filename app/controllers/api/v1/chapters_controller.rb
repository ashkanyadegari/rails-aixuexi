class Api::V1::ChaptersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  def index
    @chapters = Chapter.all
  end

  def show
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name, :description, :photo)
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def render_error
    render json: { errors: @course.errors.full_messages },
      status: :unprocessable_entity
  end
end
