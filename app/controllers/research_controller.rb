class ResearchController < ApplicationController
  respond_to :html

  def show
    @on_research_page = true
  end
  
end
