class Role < ActiveRecord::Base
	has_many :users
	validates_uniqueness_of :name , :message => "角色名称不能相同！"
	validates_uniqueness_of :id , :message => "角色ID不能相同！"
end
