module HelperMethods
  def setup_admin(**options)
    password = options[:password] || 'test123456'

    @admin = create(:admin, password: password, password_confirmation: password)
  end

  def setup_admin_and_sign_in
    setup_admin

    visit new_admin_session_path
    fill_in :admin_email, :with => @admin.email
    fill_in :admin_password, :with => 'test123456'
    click_button "Sign in"
  end
end

RSpec.configuration.include HelperMethods
