class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    HardWorker.perform_in(5.minutes, 'bob', 5)
  end
end
