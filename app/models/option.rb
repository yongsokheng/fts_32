class Option < ActiveRecord::Base
  belongs_to :question
  has_many :exams_questions, dependent: :destroy

  validates :option, presence: true
end
