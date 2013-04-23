require 'spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Hydra::Application.new
end

describe "Releases API", type: :api do
  let!(:admin) { create(:admin, email: 'carlos@eddorre.com') }
  let(:payload) do
    { email_address: 'carlos@eddorre.com', branch: 'master', environment: 'production', deployed_at: Time.now }
  end
  let(:project) { create(:project) }
  let(:api_key) { create(:api_key) }

  it "should return a 401 error when attempting to create a release with an incorrect api key" do
    post api_project_releases_path(project, format: :json), access_token: 'foo', release: payload.to_json

    expect(response.status).to eq 401
  end

  it "should create a new release" do
    post api_project_releases_path(project, format: :json), access_token: api_key.access_token, release: payload.to_json

    expect(response.status).to eq 200
  end

  it "should return a 412 error when attempting to create a release that is invalid" do
    post api_project_releases_path(project, format: :json), access_token: api_key.access_token, release: 'foobar'

    expect(response.status).to eq 412
    expect(response.body).to eq 'Payload is not in JSON format'
  end

  it "should return a 404 when a project is not found" do
    post api_project_releases_path('test', format: :json), access_token: api_key.access_token, release: 'foobar'

    expect(response.status).to eq 404
    expect(response.body).to eq 'Project not found'
  end

  it "should return a 412 error when attempting to create a release and there is no data supplied" do
    post api_project_releases_path(project, format: :json), access_token: api_key.access_token

    expect(response.status).to eq 412
    expect(response.body).to eq 'No JSON payload specified'
  end
end
