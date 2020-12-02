class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    # taking in a course id
    # Find all the questions base on the course id
    @quesion = Question.find(params[:id])
    # @questions = Question.all
  end

  # def create
  #   @question = Question.find(params[:question_id])
  #   @choice = Choice.new(choice_params@story = Story.find(params[:id])
  #   @choice.question = @question
  # if @choice.save
  #   redirect_to course_path(@courses)
  # else
  #   render "courses/show"
  # end
  # end
end


# link_to "Label", :controller => :my_controller, :action => :index
