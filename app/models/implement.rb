class Implement < ActiveRecord::Base
  belongs_to :project
  belongs_to :department
  validates :job, presence: true
  # validates :department_id , :uniqueness => {:scope => :project_id} 
  validates_uniqueness_of :department_id , :on => :create, :uniqueness => {:scope => :project_id} ,:message => "该部门已经分配任务！" 

end
