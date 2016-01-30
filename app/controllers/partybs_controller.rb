class PartybsController < ApplicationController
  def index
	@partybs = Partyb.paginate(page: params[:page])
  end

  def new
	@partyb = Partyb.new
  end
  
  def create
    @partyb = Partyb.new(partyb_params)
	if @partyb.save
      flash[:success] = "业务往来单位新建呈贡!"
      redirect_to partybs_url
    else
      render 'new'
    end
  end
  
  def edit
    @partyb = Partyb.find(params[:id])
  end
   
  def update
    @partyb = Partyb.find(params[:id])
    if @partyb.update_attributes(partyb_params)
      flash[:success] = "单位信息已修改！"
      redirect_to partybs_url
    else
      render 'edit'
    end
  end

  def destroy
    Partyb.find(params[:id]).destroy
	flash[:success] = "参与人员已经删除"
    redirect_to partybs_url
  end  
 
  private

    def partyb_params
      params.require(:partyb).permit(:name, :corporation, :contacts,:contacts_tel,:corporation_tel,:address,:postcode,:bank,:account )
    end
  
end
