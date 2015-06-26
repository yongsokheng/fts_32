class DeleteExamWorker
  include Sidekiq::Worker
  
  def perform
    exams = Exam.select_exam_not_start_after_hour 8
    exams.each do |exam|
      exam.destroy
    end
  end
end
