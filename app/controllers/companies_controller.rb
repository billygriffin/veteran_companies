class CompaniesController < ActionController::Base
  
  def index
    @companies = Company.all
  end
  
end
