if Rails.env == 'production'
  Bugsnag.configure do |config|
    config.api_key = "1db5aad752923f2ee89c764fe0a1d356"
    config.use_ssl = true
  end
end
