require 'spec_helper'

describe Release do
  let(:release) { build(:release) }

  it "should not be valid without a project" do
    release.project = nil

    expect(release).not_to be_valid
    expect(release).to have(1).error_on(:project)
  end

  it "should not be valid without an admin" do
    release.admin = nil

    expect(release).not_to be_valid
    expect(release).to have(1).error_on(:admin)
  end
end
