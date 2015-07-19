class Admin::CompaniesController < Admin::ParentController
  defaults resource_class: Company
  
  def permitted_params
    params.permit(company: [ :name, :url, :employees_count, :total_funding, :stage, :year_founded, :qualification ])
  end

  def resource_title
    %w(index new).include?(action_name) ? super : resource.name
  end
end
