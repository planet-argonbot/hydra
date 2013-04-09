require 'spec_helper'

describe "Releases API" do
  let(:admin) { create(:admin) }
  let(:payload) do
    { :email_address => 'carlos@eddorre.com', :branch => 'master', :environment => 'production' }
  end
  let(:project) { create(:project) }

  it "should return a 410 error when attempting to create a release with an incorrect api key" do
    puts "PATH #{api_project_releases_path}"
    post api_project_releases_path(project, :json, 'foobar'), :release => payload.to_json

    expect(last_response.status).to eq 401
    expect(last_response.body).to eq "Unauthorized"
  end

  it "should create a new release"

  it "should return a 412 error when attempting to create a release that is invalid"

  it "should return a 404 when a project is not found"

  it "should return a 412 error when attempting to create a release and there is no data supplied"
end