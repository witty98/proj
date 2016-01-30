class Partaker < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_uniqueness_of :user_id , :on => :create, :uniqueness => {:scope => :project_id} ,:message => "人员重复！" 
end
