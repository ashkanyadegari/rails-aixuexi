class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :update, :edit, :destroy]
  def index
    question = params[:question_id]
    @choice = Choice.where(question_id: question)
  end

  def show
  end

  def new
    @question = Question.find(params[:question_id])
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    @question = Question.find(params[:question_id])
    @choice.question = @question
    @choice.is_correct
    @choice.save
    p @choice
    p @choice
    p @choice

    redirect_to question_path(@question)
  end

  def destroy
    @choice.destroy
    redirect_to choices_path, notice: "The answer choice has been deleted."
  end

  private

  def choice_params
    params.require(:choice).permit(:choice, :answer, :is_correct)
  end

  def set_choice
    @choice = Choice.find(params[:question_id])
  end
end
