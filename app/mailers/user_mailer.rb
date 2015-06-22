class UserMailer < ApplicationMailer
  def inform_user exam
    @exam = exam
    mail to: exam.user.email, subject: t("messages.subject")
  end
end
