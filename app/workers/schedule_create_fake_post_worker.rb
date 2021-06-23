class ScheduleCreateFakePostWorker
  include Sidekiq::Worker

  def perform
    seconds_to_delay = rand(0..3601).seconds
    CreateFakePostWorker.perform_in(seconds_to_delay)
  end
end
