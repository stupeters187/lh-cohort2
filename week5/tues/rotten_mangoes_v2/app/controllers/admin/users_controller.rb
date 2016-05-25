class Admin::UsersController < ApplicationController

  def index
    redirect_to :root if !current_user.admin
    @users = User.page(params[:page]).per(5)
  end

end
