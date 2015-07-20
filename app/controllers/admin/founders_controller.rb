class Admin::FoundersController < Admin::ParentController
  defaults resource_class: Founder
  
  def permitted_params
    params.permit(founder: [ :name, :url ])
  end

  def resource_title
    %w(index new).include?(action_name) ? super : resource.name
  end

end
