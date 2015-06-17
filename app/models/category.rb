class Category < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :duration, presence: true, numericality: {only_integer: true, 
    greater_than: 0}
  validates :name, presence: true
  validates :question_number, presence: true, numericality: {only_integer: true, 
    greater_than: 0}
end
