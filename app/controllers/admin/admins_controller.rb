class Admin::AdminsController < Admin::ApplicationController

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.where(id: params[:id]).first
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    @admin.save_context = :ui

    if @admin.save
      add_message "Admin was created successfully."
      redirect_to admin_admins_path
    else
      add_error "There was an error creating the admin. Please try again."
      render :new
    end
  end

end