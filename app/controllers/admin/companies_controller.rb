class Admin::CompaniesController < Admin::ParentController
  defaults resource_class: Company

  has_scope :status, default: 'pending', only: [:index] do |controller, scope, value|
    value == "published" ? scope.published : scope.pending
  end
  
  def permitted_params
    params.permit(company: [ :name, 
                             :url, 
                             :employees_count, 
                             :total_funding, 
                             :stage, 
                             :year_founded, 
                             :qualification, 
                             {:founder_ids => [] }, 
                             {:organization_ids => [] }
                           ])
  end

  def resource_title
    %w(index new).include?(action_name) ? super : resource.name
  end

  def publish
    resource.publish
    resource.save!(validate: false)
    flash[:notice] = 'The company is now live on the site.'
    redirect_to admin_companies_path
  end

  def take_offline
    resource.take_offline
    resource.save!(validate: false)
    flash[:notice] = 'The company is now pending.'
    redirect_to :back
  end
end
