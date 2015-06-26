class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @exam = Exam.new
    if params[:exam].nil? || Settings.status.all.downcase == params[:exam][:status]
      @exams = Exam.paginate(page: params[:page]).order created_at: :DESC
    else
      @exams = Exam.find_by_status(params[:exam][:status]).paginate page: params[:page] 
    end
  end

  def update
    @exam = Exam.find params[:exam][:exam_id]
    InformResultWorker.perform_async @exam.id 
    @exam.update_attribute :status, Settings.status.viewed
    if (user_id = params[:exam][:user_id]).present?
      @exams = User.find(user_id).exams.paginate(page: params[:page]).
        order created_at: :DESC
    else
       @exams = Exam.paginate(page: params[:page]).order created_at: :DESC
    end
  end

  private 
  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
