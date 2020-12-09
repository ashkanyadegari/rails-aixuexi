class Api::V1::QuestionsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:useranswer]
  def index
    course_id = params[:course_id]
    # Find all the questions base on the course id
    @questions = Question.where(course_id: course_id)
    # render json: @questions
  end

  def useranswer
    answers = params[:answer]
    p answers


    answers.each do |answer|
      # ua = UserAnswer.new(answer)
      ans = UserAnswer.where(user_id: answer["user_id"], question_id: answer["question_id"])
      ans.destroy_all
      ua = UserAnswer.new(user_id: answer["user_id"], question_id: answer["question_id"], choice_id: answer["choice_id"])
      ua.save
      p ua.errors
    end
    render json: {status: :OK}
  end

  def getresult
    @results = UserAnswer.where(user_id: params["user_id"].to_i)
    @result_list = @results.select { |element| element.question.course.id == params["course_id"].to_i}
    @result_list = @result_list.last(4) ## Should be dynamic

    @sum = 0
    @result_list.each do |result|
      if result.choice.is_correct
        @sum += 25
      end
    end
    @points = @sum

    update_points(@results)
    @course = OngoingCourse.where(course_id: params["course_id"].to_i)
    @course[0].is_completed = true
    @course[0].save
  end

  private
  def answer_params
    params.require(:answer).permit(:user_id, :course_id, :question_id)
  end

  def update_points(results)
    sum = 0
    results.each do |result|
      if result.choice.is_correct
        sum += 25
      end
    end
    user = User.find(results.last.user_id)
    user.user_points = sum
    user.save
  end

end
# link_to "Label", :controller => :my_controller, :action => :index
