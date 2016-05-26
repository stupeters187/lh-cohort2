class Admin::UsersController < ApplicationController

  def index
    redirect_to :root if !current_user.admin
    @users = User.page(params[:page]).per(5)
  end


  def destroy
    @user = User.find(params[:id])
    ExampleMailer.sample_email(@user).deliver
    @user.destroy
    respond_to do |format|
      if @user
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @user, notice: 'User was successfully deleted.' }
        format.json { render :show, status: :created, location: @user }
        redirect_to admin_users_path
      end
    end
  end

  def show
    render :index
  end
end
