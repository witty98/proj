class Partyb < ActiveRecord::Base
  has_many :contracts
  validates_presence_of  :name, presence: true, :message => "单位名称不能为空！"
  validates_uniqueness_of :name, :message => "单位名称不能相同！"
  validates_format_of :postcode, :with => /[0-9]/,  allow_blank: true,
    message: "邮编必须是数字组成！" 

  validates_format_of :account,:with => /[0-9]/,allow_blank: true,:message => "账户必须是数字组成！"
  validates_format_of :contacts_tel,:with => /[0-9]/, allow_blank: true,:message => "电话必须是数字组成！"
  validates_format_of :corporation_tel,:with => /[0-9]/,allow_blank: true,:message => "电话必须是数字组成！"
end
