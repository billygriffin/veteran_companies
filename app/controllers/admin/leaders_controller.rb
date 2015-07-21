class Admin::LeadersController < Admin::ParentController
  defaults resource_class: Leader
  
  def permitted_params
    params.permit(leader: [ :name, :url ])
  end

  def resource_title
    %w(index new).include?(action_name) ? super : resource.name
  end

end
