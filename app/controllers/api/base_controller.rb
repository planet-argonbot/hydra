class Api::BaseController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access
  respond_to :json

  private
  def restrict_access
    api_key = ApiKey.active.where("access_token = ?", params[:access_token]).first
    head :unauthorized unless api_key
  end
end