class WelcomeController < ApplicationController
  def index
  end
  def show
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(4)
  end
end
