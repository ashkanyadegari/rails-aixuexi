json.data do
  json.mycourses @courses
  json.myquizzes @quizzes.count
  json.totalcourses Course.all.count
  json.totalquestions Question.all.count
end
