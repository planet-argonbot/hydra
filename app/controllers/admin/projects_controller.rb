class Admin::ProjectsController < Admin::ApplicationController
  before_filter :fetch_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @releases = @project.releases.all
  end

  protected
  def fetch_project
    @project = Project.where("name = ?", params[:id]).first
  end
end
