json.results do
  json.array! @result_list do |result|
    json.data result
    json.question result.question.question
    json.user_answer result.choice.answer
    json.correct result.choice.is_correct
    json.answer Question.find(result.question_id).choices.where(is_correct: true)
  end
end
json.points @points
