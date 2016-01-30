class DealsController < ApplicationController
  def index
	@deals = Deal.paginate(page: params[:page])
  end

  def new
	@deal = Deal.new
  end
  
  def create
    @contract = Contract.find(deal_params[:contract_id])
    @deal = @contract.deals.build(deal_params)

    if @deal.save
      flash[:success] = "收付款记录已保存!"
      redirect_to @contract 
	else
       render 'new'
    end
  end 
   
  def edit
	
  end
  
  private

    def deal_params
      params.require(:deal).permit(:name,:contract_id,:plan_amount,:amount,:user_id,:deal_time)
    end
end
