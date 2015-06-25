class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
    @exams = @user.exams.paginate(page: params[:page]).order created_at: :DESC
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = t "flashs.delete"
    redirect_to admin_users_path
  end

  private
  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
