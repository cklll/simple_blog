schedule_file = "config/schedules/#{Rails.env}.yml"

redis = Redis.new(username: 'myname', password: 'mysecret')

# !!!! NOTE that in production, we connect to external redis WITHOUT SSL !!!!
redis_option = { url: "redis://#{ENV['REDIS_ENDPOINT']}:#{ENV['REDIS_PORT']}/#{ENV['REDIS_DB']}" }
redis_option[:password] = ENV['REDIS_PASSWORD'] if ENV['REDIS_PASSWORD'].present?

Sidekiq.configure_server do |config|
  config.redis = redis_option
end

Sidekiq.configure_client do |config|
  config.redis = redis_option
end

# if File.exist?(schedule_file) && Sidekiq.server?
if Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
