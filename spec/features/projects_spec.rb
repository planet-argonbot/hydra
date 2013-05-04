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

  scenario "An admin should be able to see the count of releases for a project" do
    project = create(:project)
    release = create(:release, project: project, admin: @admin)

    visit admin_projects_path

    expect(page).to have_content "1"
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
    release = create(:release, project: project, admin: @admin)

    visit admin_project_path(project)
    expect(page).to have_content release.branch
  end
end

feature "Creating a new project" do
  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to create a new project" do
    visit new_admin_project_path

    name = Faker::Name.name

    fill_in :project_name, with: name
    click_button "Create project"

    expect(page).to have_content name
  end
end