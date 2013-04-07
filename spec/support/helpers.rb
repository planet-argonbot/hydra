module HelperMethods
  def setup_admin(**options)
    password = options[:password] || 'test123456'

    @admin = create(:admin, password: password, password_confirmation: password)
  end
end

RSpec.configuration.include HelperMethods