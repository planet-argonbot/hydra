require 'spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Hydra::Application.new
end

describe "Releases API", type: :api do
  let!(:admin) { create(:admin, email: 'carlos@eddorre.com') }
  let(:payload) do
    { email_address: 'carlos@eddorre.com', branch: 'master', environment: 'production' }
  end
  let(:project) { create(:project) }

  it "should return a 401 error when attempting to create a release with an incorrect api key" do
    post api_project_releases_path(project, format: :json), access_token: 'foo', release: payload.to_json

    expect(response.status).to eq 401
  end

  it "should create a new release"

  it "should return a 412 error when attempting to create a release that is invalid"

  it "should return a 404 when a project is not found"

  it "should return a 412 error when attempting to create a release and there is no data supplied"
end
