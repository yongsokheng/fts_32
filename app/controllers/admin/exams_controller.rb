class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @exam = Exam.new
    @exams = Exam.order created_at: :DESC
    if params[:exam].present?
      exam_status = params[:exam][:status]
      @exams = Exam.find_by_status exam_status unless Settings.status.all.downcase == exam_status 
    end
  end

  def update
    @exam = Exam.find params[:exam][:exam_id]
    @exam.update_attribute :status, Settings.status.viewed
    @exams = Exam.order created_at: :DESC
  end

  private 
  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
