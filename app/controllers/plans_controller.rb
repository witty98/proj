class PlansController < ApplicationController
  def new
  	  @plan = Plan.new	
  end
  
  def create
    @project = Project.find(plan_params[:project_id])
    @plan = @project.plans.build(plan_params)

    if @plan.save
      flash[:success] = "计划步骤已建立!"
      redirect_to @project 
	else
       render 'new'
    end
  end  
  
  def edit
    @plan = Plan.find(params[:id])
  end   
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      flash[:success] = "计划步骤已修改！"
      redirect_to projects_url
    else
      render 'edit'
    end
  end
  
  def destroy
    Plan.find(params[:id]).destroy
	flash[:success] = "参与人员已经删除"
    redirect_to projects_path
  end
  
  private

    def plan_params
      params.require(:plan).permit(:name,:content,:project_id,:start,:plan_end)
    end
end
