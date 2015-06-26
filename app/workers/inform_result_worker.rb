class InformResultWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    UserMailer.inform_score(exam).deliver_now
  end
end
