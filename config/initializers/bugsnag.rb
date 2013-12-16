if Rails.env == 'production'
  Bugsnag.configure do |config|
    config.api_key = "8acda8a0db2f1f95b8a107c8381f7ebf"
  end
end
