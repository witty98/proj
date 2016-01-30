class WorklogsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @worklog = current_user.worklogs.build(worklog_params)
    if @worklog.save
      flash[:success] = "日志已记录!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @worklog.destroy
    flash[:success] = "日志已删除"
    redirect_to request.referrer || root_url
  end

  private

    def worklog_params
      params.require(:worklog).permit(:content)
    end
	
    def correct_user
      @worklog = current_user.worklogs.find_by(id: params[:id])
      redirect_to root_url if @worklog.nil?
    end
end
