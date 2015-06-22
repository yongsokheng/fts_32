class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exam = Exam.new
    @exams = current_user.exams.paginate(page: params[:page], per_page: 15)
      .order "created_at DESC"
  end

  def show
    @exam = Exam.find params[:id]
    @category = @exam.category
    if @exam.start?
      @exam.create_exams_questions @category
      @exam.update_attribute :status, Settings.status.testing
    end
    @duration = @category.duration * 60 - (Time.zone.now - 
      @exam.exams_questions.first.created_at).to_i
  end

  def create
    @exam = current_user.exams.build exam_params
    flash[:alert] = t "flashs.invalid" unless @exam.save
    redirect_to exams_url
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.time_out?
      params[:exam][:status] = Settings.status.unviewed
    end
    if @exam.update_attributes exam_params
      flash[:notice] = t "flashs.success_submit"
    else
      flash[:alert] = t "flashs.invalid"
    end
    redirect_to exams_url
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :status, 
      exams_questions_attributes: [:id, :option_id]
  end
end
