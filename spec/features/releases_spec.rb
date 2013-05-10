require 'spec_helper'

feature "Creating a manual release" do
  let(:project) { create(:project) }

  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to create a manual release" do
    visit admin_project_path(project)

    click_link "Add a manual release"

    select @admin.name, from: :release_email_address
    fill_in :release_branch, with: 'testing-branch-1'
    fill_in :release_environment, with: 'staging'

    click_button "Create release"

    expect(page).to have_content 'testing-branch-1'
  end
end