# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! username: "Sokheng", email: "a@gmail.com", password: "12345678", 
  password_confirmation: "12345678",admin: true

Category.create! name: "Java", question_number: 10, duration: 1
Category.create! name: "C#", question_number: 20, duration: 1
Category.create! name: "Ruby", question_number: 20, duration: 1

categories = Category.all
categories.each do |category|
  30.times do 
    question = Faker::Lorem.sentence
    category.questions.create! question: question
  end
end

questions = Question.all
questions.each do |question|
  3.times do
    option = Faker::Lorem.word
    question.options.create! option: option
  end
  option = Faker::Lorem.word
  question.options.create! option: option, correct_option: true
end

user = User.first
user.exams.create! category_id: 1
user.exams.create! category_id: 2
