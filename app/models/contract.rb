require 'carrierwave/orm/activerecord'
class Contract < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :project
  belongs_to :partyb
  belongs_to :paytype
  has_many :deals
  default_scope -> { order(created_at: :desc) }
  
  validates_presence_of  :name, presence: true, :message => "合同名称不能为空！"
  validates_presence_of  :code, presence: true, :message => "合同代码不能为空！"
  validates_uniqueness_of :code, :message => "合同代码不能相同！"
  validates :total, numericality: { greater_than: 0 },  allow_blank: true
  validates :surplus, numericality: { greater_than: 0 },  allow_blank: true
end
