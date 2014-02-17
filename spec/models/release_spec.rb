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
  
  describe "Setting an admin user automatically" do
    let!(:admin_user) { create(:admin, email: 'carlos@planetargon.com') }
    let(:release) { build(:release, admin: nil) }

    it "associates release admin user by provided email" do
      release.email_address = 'carlos@planetargon.com'
      release.save

      expect(release.admin).to eq(admin_user)
    end

    it "associates release admin user by provided email alias" do
      admin_user.update_attributes(email_aliases: 'alias@example.com')
      release.email_address ='alias@example.com'
      release.save

      expect(release.admin).to eq admin_user
    end

    it "does not associate the admin user when the alias doesn't match" do
      admin_user.update_attributes(email_aliases: 'not@example.com')
      release.email_address ='alias@example.com'
      release.save

      expect(release.admin).not_to eq admin_user
    end
  end
end
