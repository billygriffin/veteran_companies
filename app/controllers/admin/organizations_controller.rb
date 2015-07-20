class Admin::OrganizationsController < Admin::ParentController
  defaults resource_class: Organization
  
  def permitted_params
    params.permit(organization: [ :name, :url ])
  end

  def resource_title
    %w(index new).include?(action_name) ? super : resource.name
  end

end
