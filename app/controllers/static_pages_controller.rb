class StaticPagesController < ApplicationController
  def index
    redirect_to exams_url if user_signed_in?
  end
end
