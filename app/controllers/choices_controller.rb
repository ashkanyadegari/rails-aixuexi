class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :update, :edit, :destroy]
  def index
    @choices = Choice.all
    p @choices
  end

  def show
  end

  def new
    @question = Question.find(params[:question_id])
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      render json: {choice: @choice, status: :created}
    else
      render_error
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:choice, :answer, :is_correct)
  end

  def set_choice
    @choice = Choice.find(params[:question_id])
  end
end
