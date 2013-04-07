require 'spec_helper'

feature "Viewing a list of projects" do
  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to see a list of projects" do
    create(:project, name: 'This is a test project')

    visit admin_projects_path

    expect(page).to have_content 'This is a test project'
  end
end

feature "Viewing an individual project" do
  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to see the project name"

  scenario "An admin should be able to see releases for the project"
end