class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :exams_questions, dependent: :destroy
  has_many :questions, through: :exams_questions

  accepts_nested_attributes_for :exams_questions

  scope :select_random_question, ->(category){category.questions
    .limit(category.question_number)
    .order("RAND()")}
  scope :find_by_status, ->(exam_status){where(status: "#{exam_status}")
    .order created_at: :DESC}

  def create_exams_questions category
    question_ids = Exam.select_random_question(category).pluck :id
    self.question_ids = question_ids
  end

  def time_out?
    if exams_questions.count > 0
      created_time = exams_questions.first.created_at
    else
      created_time = Time.now.utc
    end
    Time.now.utc > created_time + category.duration.minutes
  end

  def start?
    Settings.status.start == status
  end

  def testing?
    Settings.status.testing == status
  end

  def unviewed?
    Settings.status.unviewed == status
  end

  def viewed?
    Settings.status.viewed == status
  end

  def update_testing_to_unviewed
    if time_out? && testing?
      update_attribute :status, Settings.status.unviewed
    end
  end

  def create_not_start_after_hour? hour
    create_peroid = (Time.now.utc - created_at) / 3600
    start? && create_peroid > hour
  end
end
