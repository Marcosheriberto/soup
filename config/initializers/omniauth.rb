Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :instagram, ENV['INSTAGRAM_KEY'], ENV['INSTAGRAM_SECRET']
end
