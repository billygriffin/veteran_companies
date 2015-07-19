class Admin::ParentController < Adminsimple::BaseController
  before_action :authenticate_admin!
end
