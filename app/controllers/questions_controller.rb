class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :edit, :destroy]
  def index
    course = params[:course_id]
    @question = Question.where(course_id: course)
  end

  def show
  end

  def new
    @course = Course.find(params[:course_id])
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save

    redirect_to questions_path

    ## When you save it
    ## it should create a question first
    ## Question id is used for choice createh
  end

  def edit
    if @question.edit(question_params)
      render json: {question: @question, status: :edited}
    else
      render_error
    end
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:question, :course_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
