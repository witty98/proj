class RolesController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :admin_user, only: [:update, :destroy]
  def index
	@roles = Role.all
  end

  def new
	@role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "角色已建立!"
      redirect_to roles_path 
	else
       render 'new'
    end
  end 
  
  def edit
	@role = Role.find(params[:id])
  end
 
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      flash[:success] = "角色已修改！"
      redirect_to roles_path 
    else
      render 'edit'
    end
  end

  def destroy
    Role.find(params[:id]).destroy
    flash[:success] = "删除成功！"
    redirect_to roles_path
  end
  
  private

    def role_params
      params.require(:role).permit(:id,:name,:definition)
    end
   # Confirms an admin user the role equel 0.
    # def admin_user
	  # @user=User.find_by(id:session[:user_id])
      # redirect_to(root_url) unless role_admin?
    # end
end
