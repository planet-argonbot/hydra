class Api::ReleasesController < Api::BaseController
  before_filter :fetch_project

  respond_to :json

  def create
    respond_with('No JSON payload specified', status: :precondition_failed, location: api_project_releases_path) and return if params[:release].blank?

    parsed_payload = JSON.parse(params[:release]).symbolize_keys!

    @release = @project.releases.new(parsed_payload)
    @release.created_by = 'api'

    if @release.save
      respond_with(@release, status: :ok, location: api_project_releases_path)
    else
      respond_with('Could not create release', status: :internal_server_error, location: api_project_releases_path)
    end

    rescue JSON::ParserError
      respond_with('Payload is not in JSON format', status: :precondition_failed, location: api_project_releases_path)
  end

  protected
  def fetch_project
    @project = Project.find(params[:project_id])

    rescue ActiveRecord::RecordNotFound
      respond_with('Project not found', status: :not_found, location: api_project_releases_path)
  end
end
