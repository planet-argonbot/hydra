require 'spec_helper'

feature "An admin viewing other admins" do
  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to see a list of all admins" do
    admin = create(:admin)

    visit admin_admins_path

    expect(page).to have_content admin.name
  end
end