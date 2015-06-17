class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exam = Exam.new
    @exams = Exam.all
  end
  
  def create
    @exam = current_user.exams.build exam_params
    flash[:danger] = t "flashs.invalid" unless @exam.save
    redirect_to exams_url
  end

  private
  def exam_params
    params.require(:exam).permit :category_id
  end
end
