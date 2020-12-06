# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying all seeds'
Course.destroy_all

content = ["As proof of his bar’s higher intent, his drinks program extends beyond picking fruit from within walking distance of his bar. At last count, the bar produced just 40g or so of waste on a busy Friday night – the size of a wallet and a phone, but lighter – which sometimes unfortunately include tissues that wheezy customers bring in.", "The bar runs fully on solar energy, and contrary to procurement wisdom, his team shops for ingredients at local wet markets that don’t wrap their produce in plastic and then tote it back in their own reuseable bags.", "While his drive towards a zero-waste bar program is ahead of the curve and isn’t always practical for every bar to sign on to, he believes that the industry as a whole can each do their bit to tip the scales in the environment’s favour. ", "As a community, we really have to diversify how we look at acidity, he says. Instead of usual suspects like limes and lemons", "The bar pays a glass recycling service $40 a month to take away its used bottles. It’s just $40 man, get with the program,"]
sum = 0


5.times do
  course = Course.new(name: Faker::Name.first_name, description: content[sum])
  file = URI.open("https://picsum.photos/600")
  course.photos.attach(io: file, filename: "#{course.name}.png", content_type: 'image/png')
  course.save
  puts "#{course.name} got created"

  puts 'Destroying all questions'
  4.times do
    question = Question.new(course_id: course.id, question: Faker::Lorem.question(word_count: 4))
    question.save
    puts "#{question.question} got created"

  puts 'Destroying all choices'
    choice = Choice.new(question_id: question.id, answer: Faker::Books::Dune.quote, is_correct: true)
    choice.save
    puts "#{choice.answer} got created"
  p "the false is being created"
  3.times do
    choice = Choice.new(question_id: question.id, answer: Faker::Books::Dune.quote, is_correct: false)
    choice.save
    puts "#{choice.answer} got created"
  end
  end
  sum += 1
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

