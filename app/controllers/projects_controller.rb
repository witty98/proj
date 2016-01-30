class ProjectsController < ApplicationController
  before_action :logged_in_user

   def new
	  @project = Project.new
	  if Project.last.nil?
  		@project.monthid = 1
	  else
		  last = Project.first
		  last_month = last.code[4,6]
		  if last_month == Time.now.strftime('%Y%m').to_s
			 @project.monthid = last.monthid + 1
		  else
			 @project.monthid = 1
		  end
	  end
	  strnow = "KLIC"+ Time.now.strftime('%Y').to_s+Time.now.strftime('%m').to_s
	  @project.code = strnow + "-" + @project.monthid.to_s
	  @implement= @project.implements.build
   end
   
  def index
    @projects = Project.paginate(page: params[:page])
  end
  
  def show
    @project = Project.find(params[:id])
  	# @implement= @project.implements.build
    @implements = @project.implements.paginate(page: params[:page])	
    @partakers = @project.partakers.paginate(page: params[:page])
	@plans = @project.plans.paginate(page: params[:page])
  end
  
  def create
    @project = Project.new(project_params)
	if @project.save
      flash[:success] = "项目新建成功!"
      redirect_to projects_url
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end   
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "项目已修改！"
      redirect_to projects_url
    else
      render 'edit'
    end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "删除成功！"
    redirect_to projects_url
  end
 
 
  private

    def project_params
      params.require(:project).permit(:name, :code, :ProjectType_id,
                                   :user_id,:ProjectStatus_id,:monthid,:start_time,:end_time)
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
end
