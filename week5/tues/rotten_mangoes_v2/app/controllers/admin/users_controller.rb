class Admin::UsersController < ApplicationController

  def index
    redirect_to :root if !current_user.admin
  end

end
