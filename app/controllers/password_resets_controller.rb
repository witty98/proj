class PasswordResetsController < ApplicationController

  def new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "密码不能为空！")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "密码已修改."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
