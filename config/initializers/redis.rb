$redis = Redis.new(url: ENV["REDIS_URL"])


uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://localhost:6379/"))
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
