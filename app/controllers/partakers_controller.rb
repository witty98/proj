class PartakersController < ApplicationController
  before_action :logged_in_user 
  
  def new
	@partaker = Partaker.new
	@users = User.all
  end
  
  def create
    @project = Project.find(params[:partaker][:project_id])
	selected_users = params[:users]
	#删除未选中用户
	# primary_partakers = Partaker.where.not(user_id:selected_users).where(:project_id => @project.id)
	# primary_partakers.each do |pa|
		# pa.destroy
	# end	
	
	#保存新增用户
	
	s = "人员："
	selected_users.each do |n|
	    if Partaker.where(:project_id => @project.id).where(:user_id => n ).nil? == false
			@project.partakers.create(:project_id => @project.id,:user_id => n)
			s = s + User.find(n).name + "，"
		end
	end
	flash[:success] = s + "已加入该项目!"
	redirect_to projects_path
  end  
  
  def destroy
    Partaker.find(params[:id]).destroy
	flash[:success] = "参与人员已经删除"
    redirect_to projects_path
  end

end
