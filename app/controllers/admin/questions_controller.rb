class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def show
    @question = Question.find params[:id]
    @options = @question.options
  end

  def new
    @question = Question.new
    @question.options.build
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:notice] = t "flashs.save_success"
      redirect_to [:admin, @question]
    else
      render "new"
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:notice] = t "flashs.save_success"
      redirect_to [:admin, @question]
    else
      render "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    redirect_to request.referrer || root_url
  end

  private
  def question_params
    params.require(:question).permit :question, :category_id, 
      options_attributes: [:id, :option, :correct_option, :_destroy]
  end

  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
