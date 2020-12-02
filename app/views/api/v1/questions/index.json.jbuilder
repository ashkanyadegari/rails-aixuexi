json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :question, :course_id
      json.choices question.choices

  end
end
