class Api::V1::CoursesController < Api::V1::BaseController
  before_action :set_course, only: [:show, :edit, :destroy, :update]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy, :joincourse, :getusercourses]

  def index
     if params[:user_id]
      @courses = Course.where(user_id: params[:user_id])
      # render json: @courses #Just for testing
    elsif params[:query].present?
      @courses = Course.search_by_name_and_description(params[:query])
    else
      @courses = Course.all
      # render json: @courses #Just for testing
    end
  end

  def show
    if !@course.file.service_url.blank?
      @video_url = @course.file.service_url
    else
      @video_url = ""
    end
      rescue NoMethodError => e
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

  def joincourse
    p params
    @start = OngoingCourse.new(user_id: params["user_id"], course_id: params["course_id"])
    p @start.errors
    @start.save
    render json: {stat: @start, status: :works}
  end

  def getusercourses
    p params
    @user = User.find(params["user_id"])
    @courses = OngoingCourse.where(user_id: params["user_id"])
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
