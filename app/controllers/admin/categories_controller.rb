class Admin::CategoriesController < ApplicationController
  before_action :load_category, except: [:new, :edit]
  before_action :authenticate_user!
  before_action :admin_user

  def index
  end

  def show
    @category = Category.find params[:id]
    @questions = @category.questions
      .paginate(page: params[:page]).order created_at: :DESC
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params_category
    if @category.save
     respond_to do |format|
        format.html { 
          flash[:notice] = "Successful created"
          redirect_to admin_root_url  
        }
        format.js
      end
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes params_category  
      respond_to do |format|
        format.html { 
          flash[:notice] = "Update successful"
          redirect_to admin_root_url  
        }
        format.js
      end
    end   
  end

  def destroy
    @category = Category.find(params[:id]).destroy
  end

  private
  def params_category
    params.require(:category).permit :name, :question_number, :duration 
  end

  def load_category
    @categories = Category.paginate(page: params[:page]).order :name
  end

  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
