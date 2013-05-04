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

  scenario "An admin should see a message that there are no API keys when none have been created" do
    visit admin_api_keys_path

    expect(page).to have_content "There are no API keys."
  end

  scenario "An admin should be able to generate an API key when none have been created" do
    visit admin_api_keys_path

    click_link "Generate an API key"

    expect(page).not_to have_content "There are no API keys."
  end

  scenario "An admin should be able to revoke an API key" do
    api_key = create(:api_key)

    visit admin_api_keys_path

    click_link 'revoke'

    expect(page).to have_content "revoked"
  end
end