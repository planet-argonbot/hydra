class Admin::AdminsController < Admin::ApplicationController

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.where(id: params[:id]).first
  end

end