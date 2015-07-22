class LeadersController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @leader = @company.leaders.new
  end

  def create
    @company = Company.find(params[:leader][:company_id])
    @leader = @company.leaders.new

    valid = true
    (params[:name] || []).each_with_index do |name, i|
      leader = Leader.new(name: name, url: params[:url][i] || '')
      if leader.save
        leader.positions.create!(company: @company)
      else
        valid = false
      end
    end

    if valid
      redirect_to root_path
    else
      render "new"
    end
  end

  def leader_params
    params.require(:leader).permit(:name, :url)
  end
  
end
