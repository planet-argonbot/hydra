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
  let(:project) { create(:project) }

  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to see the project name" do
    visit admin_project_path(project)
    expect(page).to have_content project.name
  end

  scenario "An admin should be able to see releases for the project" do
    release = create(:release, project: project)

    visit admin_project_path(project)
    expect(page).to have_content release.branch
  end
end