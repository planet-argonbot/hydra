require 'spec_helper'

feature "Viewing a list of API keys" do
  background do
    setup_admin_and_sign_in
  end

  scenario "An admin should be able to see a list of API keys" do
    api_key = create(:api_key)

    visit admin_api_keys_path

    expect(page).to have_content api_key.access_token
  end
end