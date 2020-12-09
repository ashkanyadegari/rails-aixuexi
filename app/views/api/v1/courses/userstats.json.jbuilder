json.data do
  json.mycourses @courses.count
  json.myquizzes @quizzes.count
  json.totalcourses Course.all.count
  json.totalquestions Question.all.count
end
