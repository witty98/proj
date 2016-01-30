﻿class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @worklogs = @user.worklogs.paginate(page: params[:page])	
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "注册成功!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "密码已修改！"
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "删除成功！"
    redirect_to users_url
  end
 
  private

    def user_params
      params.require(:user).permit(:name, :namecn, :password,
                                   :password_confirmation,:role_id)
    end
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "请登录."
        redirect_to login_url
      end
    end
	
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
	
    # Confirms an admin user the role equel 0.
    def admin_user
	  @user = User.find(params[:id])
      redirect_to(root_url) unless role_admin?
    end
end