class Api::V1::CoursesController < Api::V1::BaseController
  before_action :set_course, only: [:show, :edit, :destroy, :update]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @courses = Course.all
    # render json: @courses
  end

  def show
    render json: @course
  end

  def update
    if @course.update(course_params)
      render json: {course: @course, status: :updated}
    else
      render_error
    end
  end

  def destroy
    @course.destroy
    render json: {status: :deleted}
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: {status: :created}
    else
      render_error
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def render_error
    render json: { errors: @course.errors.full_messages },
      status: :unprocessable_entity
  end
end
