Role.create!(id:"0",name:  "管理员")
Role.create!(id:"1",name:  "主任")
Role.create!(id:"2",name:  "副主任")
Role.create!(id:"3",name:  "部门主管")
Role.create!(id:"4",name:  "项目负责人")
Role.create!(id:"5",name:  "项目实施人员")
Role.create!(id:"6",name:  "财务人员")
Role.create!(id:"7",name:  "项目记录人")

User.create!(name:  "ls",
             namecn: "李四",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:0)

User.create!(name:  "zs",
             namecn: "张三",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:1)
User.create!(name:  "wxe",
             namecn: "王小二",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:2)
User.create!(name:  "ly",
             namecn: "李一",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:3)
User.create!(name:  "le",
             namecn: "李二",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:4)
User.create!(name:  "lsan",
             namecn: "李三",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:5)
User.create!(name:  "kj",
             namecn: "会计",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:6)			 			 			 
User.create!(name:  "jl",
             namecn: "记录",
             password:              "foobar",
             password_confirmation: "foobar",
			 role_id:7)	
			 
50.times do |n|
  name  = Faker::Name.name
  namecn = Faker::Name.name
  password = "password"
  User.create!(name:  name,
               namecn: namecn,
               password:              password,
               password_confirmation: password,
			   role_id:"5")
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.worklogs.create!(content: content) }
end

ProjectType.create!(name:  "规划",
             code: "gh")
ProjectType.create!(name:  "勘界",
             code: "kj")	

ProjectStatus.create!(name:  "计划")
ProjectStatus.create!(name:  "进行中")
ProjectStatus.create!(name:  "完成")

Paytype.create!(name:  "收入合同")
Paytype.create!(name:  "支出合同")

Department.create!(name:  "规划事务部",
             duty: "规划修改、报件")
Department.create!(name:  "技术服务部",
             duty: "勘界、制图")	
