class UserMailer < ApplicationMailer
  def inform_user exam
    @exam = exam
    mail to: exam.user.email, subject: t("messages.subject")
  end
  
  def inform_score exam
    @exam = exam
    mail to: exam.user.email, subject: t("messages.subject_score")
  end
end
