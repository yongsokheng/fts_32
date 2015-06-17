class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :exams_questions, dependent: :destroy
  has_many :questions, through: :exams_questions
end
