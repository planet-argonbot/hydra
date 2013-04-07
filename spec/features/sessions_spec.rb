require 'spec_helper'

feature "Signing In" do
  background do
    setup_admin password: 'test123456'
  end

  scenario "An admin should be able to sign in" do
    visit '/sign_in'
    fill_in :admin_email, :with => @admin.email
    fill_in :admin_password, :with => 'test123456'
    click_button "Sign in"
    current_path.should == admin_root_path
  end

  scenario "A person shouldn't be able to sign in with invalid authentication" do
    visit '/sign_in'
    fill_in :admin_email, :with => 'foo@bar.com'
    fill_in :admin_password, :with => 'test123456'
    click_button "Sign in"
    current_path.should == new_admin_session_path
  end
end

feature "Signing Out" do
  background do
    setup_admin password: 'test123456'
  end

  scenario "An admin should be able to sign out" do
    visit '/sign_in'
    fill_in :admin_email, :with => @admin.email
    fill_in :admin_password, :with => 'test123456'
    click_button "Sign in"
    click_link "Sign out"
    current_path.should == new_admin_session_path
  end
end

feature "Admin Access" do
  scenario "A person shouldn't be able to access the admin section if they are not signed in" do
    visit '/admin'
    current_path.should == new_admin_session_path
  end
end