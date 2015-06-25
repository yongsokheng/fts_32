desc "Inform by mailing to user when create exam and not start over 2 hours"
task inform_user_task: :environment do
  exams = Exam.all
  exams.each do |exam|
    if exam.create_not_start_after_hour? 2
      UserMailer.delay.inform_user exam
    end
  end
end
