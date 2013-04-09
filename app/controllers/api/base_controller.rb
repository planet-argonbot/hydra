class Api::BaseController < ApplicationController
  before_filter :restrict_access
  respond_to :json

  private
  def restrict_access
    api_key = ApiKey.active.where("access_token = ?", params[:access_token]).first
    head :unauthorized unless api_key
  end
end