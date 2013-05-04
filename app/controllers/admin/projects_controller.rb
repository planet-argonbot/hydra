class Admin::ProjectsController < Admin::ApplicationController
  before_filter :fetch_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @releases = @project.releases.order("deployed_at DESC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      add_message "Project was created successfully."
      redirect_to admin_projects_path
    else
      add_error "There was an error creating the project. Please try again."
      render :new
    end
  end

  protected
  def fetch_project
    @project = Project.where("name = ?", params[:id]).first
  end
end
