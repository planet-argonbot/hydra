class Admin::ApiKeysController < ApplicationController
  def index
    @api_keys = ApiKey.all
  end
end
