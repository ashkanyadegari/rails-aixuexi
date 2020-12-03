class Api::V1::QuestionsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:useranswer]
  def index
    course_id = params[:course_id]
    # Find all the questions base on the course id
    @questions = Question.where(course_id: course_id)
    # render json: @questions
  end

  def useranswer
    p params
    answers = params[:answer]
    p answers
    p "----------------"
    answers.each do |answer|
      p "testing -------"
      p answer
      p answer
      ua = UserAnswer.new(answer)
      # ua = UserAnswer.new(user_id: answer["user_id"], question_id: answer["question_id"], choice_id: answer["choice_id"])
      ua.save
      p ua.errors
    end
    render json: {status: :OK}
  end

  # private
  # def answer_params
  #   params.require(:answer).permit(:user_id, :course_id, :question_id)
  # end

end
# link_to "Label", :controller => :my_controller, :action => :index
