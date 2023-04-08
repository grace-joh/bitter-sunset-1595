class Contestants::ProjectsController < ApplicationController
  def create
    # remove instance variables bc not sending to view
    project = Project.find(params[:id])
    # find contestant to call in create
    contestant = Contestant.find(params['contestant_id'])
    # remove bang (use only in test) and pass in object rather than objects' id
    ContestantProject.create(project: project, contestant: contestant)
    redirect_to "/projects/#{project.id}"
  end
end
