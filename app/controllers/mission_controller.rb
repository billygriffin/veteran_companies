class MissionController < ApplicationController
  respond_to :html

  def show
    @on_mission_page = true
  end

end
