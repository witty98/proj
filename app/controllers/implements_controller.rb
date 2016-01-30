class ImplementsController < ApplicationController
  before_action :logged_in_user 
	
	
  def new
	  @implement = Implement.new	
  end
  
  # def index
	# @implements = @project.implements.paginate(page: params[:page])	
  # end 
  
  def create
    @project = Project.find(implement_params[:project_id])
    @implement = @project.implements.build(implement_params)

    if @implement.save
      flash[:success] = "执行部门及任务已安排!"
      redirect_to @project 
	else
       render 'new'
    end
  end  
  
  def edit
     @implement = Implement.find(params[:id])
  end

  def update
     @implement = Implement.find(params[:id])
    if @implement.update_attributes(implement_params)
      flash[:success] = "任务已修改！"
      redirect_to projects_url
    else
      render 'edit'
    end
  end 
  
  def destroy
    @implement.destroy
    flash[:success] = "执行部门及任务已删除"
    redirect_to @project
  end
  
  private

    def implement_params
      params.require(:implement).permit(:job,:department_id,:project_id)
    end
end
