# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying all seeds'
Course.destroy_all


5.times do
  course = Course.new(name: Faker::Name.first_name, description: Faker::Marketing.buzzwords)
  file = URI.open("https://picsum.photos/600")
  course.photos.attach(io: file, filename: "#{course.name}.png", content_type: 'image/png')
  course.save
  puts "#{course.name} got created"

  puts 'Destroying all questions'
  Question.destroy_all
  4.times do
    question = Question.new(course_id: course.id, question: Faker::Book.title)
    question.save
    puts "#{question.question} got created"

  puts 'Destroying all choices'
    choice = Choice.new(question_id: question.id, answer: Faker::Creature::Animal.name, is_correct: true)
    choice.save
    puts "#{choice.answer} got created"
  p "the false is being created"
  3.times do
    choice = Choice.new(question_id: question.id, answer: Faker::Creature::Animal.name, is_correct: false)
    choice.save
    puts "#{choice.answer} got created"
  end
  end
end

# puts 'Destroying all seeds'
# Question.destroy_all
# 5.times do
#   question = Question.new(course_id: Faker::IDNumber.valid, question: Faker::Book.title)
#   file = URI.open("https://picsum.photos/500")
#   question.photos.attach(io: file, filename: "#{question.name}.png", content_type: 'image/png')
#   question.save
#   puts "#{question.name} got created"
# end

