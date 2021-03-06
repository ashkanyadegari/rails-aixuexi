class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :edit, :destroy]
def index
  @courses = Course.all
end

def show
  if !@course.file.service_url.blank?
    @video_url = @course.file.service_url
  else
    @video_url = ""
  end
    rescue NoMethodError => e
end

def new
  @course = Course.new
end

def create
  @course = Course.new(course_params)
  @course.photos.attach(course_params[:photos])
  @course.file.attach(course_params[:file])
  if @course.save
    redirect_to courses_path
  else
    render_error
  end
end

def edit
end

def destroy
  @course.destroy
  redirect_to courses_path, notice: "The course #{@course.name} has been deleted."
end

def update
  if @course.update(course_params)
    render json: {course: @course, status: :updated}
  else
    render_error
  end
end

private

def course_params
  params.require(:course).permit(:name, :description, :file, photos: [])
end

def set_course
  @course = Course.find(params[:id])
end

end
