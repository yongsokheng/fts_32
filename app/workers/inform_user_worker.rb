class InformUserWorker
  include Sidekiq::Worker
  
  def perform
    exams = Exam.select_exam_not_start_below_hour 8
    exams.each do |exam|
      UserMailer.inform_user(exam).deliver_now
    end
  end
end
