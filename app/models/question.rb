class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, through: :exams_questions
  has_many :exams_questions, dependent: :destroy
  has_many :options, dependent: :destroy

  validates :question, presence: true

  accepts_nested_attributes_for :options, allow_destroy: true
end
