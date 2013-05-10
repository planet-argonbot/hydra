class Admin::ApiKeysController < Admin::ApplicationController
  before_filter :fetch_api_key, only: [ :edit, :update ]

  def index
    @api_keys = ApiKey.all
  end

  def create
    ApiKey.create
    add_message "An API key was successfully generated."
    redirect_to admin_api_keys_path
  end

  def update
    state_change = params.fetch(:status_change, 'activate')

    @api_key.revoke! if state_change == 'revoke' && @api_key.active?

    @api_key.activate! if state_change == 'activate' && @api_key.revoked?

    add_message "Changed status for API Key #{@api_key.access_token}"

    redirect_to admin_api_keys_path
  end

  private
  def fetch_api_key
    @api_key = ApiKey.where("access_token = ?", params[:id]).first
  end
end
