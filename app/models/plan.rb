class Plan < ActiveRecord::Base
  belongs_to :project
  validates_uniqueness_of :name , :message => "计划步骤名称不能相同！"
  validates_presence_of :name, :message => "计划步骤名称不能为空" 
  validates_presence_of :content, :message => "计划步骤内容不能为空" 
  validate :plan_end_after_start

  private
  
	  #检查结束时间在开始时间之后.
	  def plan_end_after_start
		if start > plan_end
		   errors[:plan_end] << "结束时间需要在开始时间之后"
		end
	  end 
end
