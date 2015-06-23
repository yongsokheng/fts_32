desc "Delete Exam when user create and not start over 24 hours"
task delete_exam_task: :environment do
  exams = Exam.all
  exams.each do |exam|
    if exam.create_not_start_after_hour? 24
      exam.destroy
    end
  end
end
