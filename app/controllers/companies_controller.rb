class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "We are reviewing your submission. Thank you for contributing to Veterans List! 
                        To enable us to verify the Veteran-Led company, please identify the Veteran Leader(s)."
      redirect_to new_leader_path(company_id: @company.id)
    else
      render "new"
    end
  end

  def company_params
    params.require(:company).permit(:name, :url, :employees_count, :total_funding, :stage, :year_founded, :total_founders, :veteran_founders, :veteran_executives)
  end
  
end
