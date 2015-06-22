class ExamsQuestion < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  belongs_to :option

  scope :correct_options, ->{joins(:option)
    .where("correct_option = true")}
end
