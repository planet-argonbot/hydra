class Admin::ReleasesController < Admin::ApplicationController
  before_filter :fetch_project

  respond_to :html

  def new
    @release = @project.releases.new
  end

  def create
    @release = @project.releases.new(params[:release])

    respond_with(@release) do |format|
      if @release.save
        add_message "Release was created successfully"
        format.html { redirect_to admin_project_path(@project) }
      else
        format.html { render :new }
      end
    end
  end

  protected
  def fetch_project
    @project = Project.find(params[:project_id])

    rescue ActiveRecord::RecordNotFound
      respond_with('Project not found', status: :not_found, location: api_project_releases_path)
  end
end
