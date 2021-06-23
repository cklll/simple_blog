schedule_file = "config/schedules/#{Rails.env}.yml"

# !!!! NOTE that in production, we connect to external redis WITHOUT SSL !!!!
redis_option = { url: "redis://#{ENV['REDIS_ENDPOINT']}:#{ENV['REDIS_PORT']}/#{ENV['REDIS_DB']}" }
redis_option[:password] = ENV['REDIS_PASSWORD'] if ENV['REDIS_PASSWORD'].present?

Sidekiq.configure_server do |config|
  config.redis = redis_option
end

Sidekiq.configure_client do |config|
  config.redis = redis_option
end

if Sidekiq.server?
  template = ERB.new File.new(schedule_file).read
  schedule_hash = YAML.load template.result(binding)

  Sidekiq::Cron::Job.load_from_hash!(schedule_hash)
end
