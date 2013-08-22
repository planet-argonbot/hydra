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

  describe "#month" do
    it "should return a release's month" do
      release.deployed_at = DateTime.new(2013,8,20)
      expect(release.month).to eq('August')
    end
  end
end
