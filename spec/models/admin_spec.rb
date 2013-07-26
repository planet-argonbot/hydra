require 'spec_helper'

describe Admin do
  it "should not be valid without a first name" do
    admin = Admin.new
    expect(admin).not_to be_valid
    expect(admin).to have(1).error_on(:first_name)
  end

  it "should not be valid without a last name" do
    admin = Admin.new
    expect(admin).not_to be_valid
    expect(admin).to have(1).error_on(:last_name)
  end

  it "should automatically generate an random password if the save content is ui" do
    admin = build(:admin, password: nil)
    admin.save_context = :ui
    admin.save

    expect(admin.encrypted_password).not_to be_blank
  end

  it "should should automatically generate a reset token on create if the save context is ui" do
    admin = build(:admin, password: nil)
    admin.save_context = :ui
    admin.save

    expect(admin.reset_password_token).not_to be_blank
  end
end
