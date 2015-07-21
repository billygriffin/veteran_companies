class LeadersController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @leader = @company.leaders.new
  end

  def create
    @leader = Leader.new(leader_params)
    @company = Company.find(params[:leader][:company_id])
    if @leader.save
      @leader.positions.create!(company: @company)
      redirect_to root_path
    else
      render "new"
    end
  end

  def leader_params
    params.require(:leader).permit(:name, :url)
  end
  
end
