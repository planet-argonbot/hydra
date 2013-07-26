require 'spec_helper'

describe Admin do
  it "should automatically generate an random password if the save content is ui." do
    admin = build(:admin, password: nil)
    admin.save_context = :ui
    admin.save

    expect(admin.encrypted_password).not_to be_blank
  end
end
