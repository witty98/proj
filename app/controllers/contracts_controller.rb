class ContractsController < ApplicationController
  def index
	@contracts = Contract.paginate(page: params[:page])
  end
  
  def show
    @contract = Contract.find(params[:id])
    @deals = @contract.deals.paginate(page: params[:page])	
  end
  
  def new
	# @projects = Project.all
	# @partybs = Partyb.all
	@contract = Contract.new
  end
  
  def create
    @contract = Contract.new(contract_params)
	@project = Project.find(@contract.project_id)
	if @contract.paytype_id == 1
		sf= 's'
	elsif @contract.paytype_id == 2
		sf = 'f'
	end
	ctype = @project.ProjectType.code
	ctypenum = 1
	Contract.all.each do |cont|
		if cont.created_at.year == Time.now.year
			if cont.project.ProjectType_id == @project.ProjectType_id
				ctypenum = ctypenum + 1
			end
		end
	end
	if Contract.first.nil?
		ls = 1	
	else

	   if Contract.first.created_at.year == Time.now.year
			ls = Contract.first.id + 1
		else
			ls = 1
		end
	end
	@contract.code = Time.now.strftime("%Y") + sf + ctype.to_s + ctypenum.to_s + '-' + ls.to_s

	if @contract.save
      flash[:success] = "合同已经新建!"
      redirect_to contracts_url
    else
      render 'new'
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end
   
  def update
    @contract = Contract.find(params[:id])
    if @contract.update_attributes(contract_params)
      flash[:success] = "合同信息已修改！"
      redirect_to contracts_url
    else
      render 'edit'
    end
  end
  
  private

    def contract_params
      params.require(:contract).permit(:name, :partyc, :paytype_id, :director,:director_tel,:total,:surplus,:detail,:sign_time,:time_limit,:project_id,:partyb_id,:avatar)
    end
end
