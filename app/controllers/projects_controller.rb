class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  # move create to contestant/projects controller
end
