class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :ProjectType
  belongs_to :ProjectStatus
  has_many :implements, dependent: :destroy
  has_many :partakers, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :contracts
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates_presence_of :name, :message => "项目名称不能为空"
  validates_presence_of :code, :message => "项目编号不能为空"
  validates_uniqueness_of :code , :message => "项目编号必须唯一"
  validates_presence_of :user_id, :message => "项目负责人不能为空" 
  validates_presence_of :ProjectStatus_id, :message => "项目状态不能为空" 
  validates_presence_of :ProjectType_id, :message => "项目类型不能为空" 
  validates_presence_of :start_time, :message => "项目开始时间不能为空" 
  validate :end_time_after_start_time

  private
  
	  #检查结束时间在开始时间之后.
	  def end_time_after_start_time
		if start_time > end_time
		   errors[:end_time] << "结束时间需要在开始时间之后"
		end
	  end 

end
