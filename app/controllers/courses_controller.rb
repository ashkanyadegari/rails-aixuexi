class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :edit, :destroy]
def index
  @course = Course.all
end

def show
end

def new
  @course = Course.new(course_params)
end

def create
  p course_params
  @course = Course.new(course_params)
  @course.photos.attach(course_params[:photos])
  @course.file.attach(course_params[:file])
  if @course.save
    render json: {course: @course, status: :created}
  else
    render_error
  end
end

def edit
  if @course.edit(course_params)
    render json: {course: @course, status: :edited}
  else
    render_error
  end
end

def destroy
  @course.destroy
  render json: {status: :deleted}
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
