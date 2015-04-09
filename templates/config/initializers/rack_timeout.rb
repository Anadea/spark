Rack::Timeout.timeout = ENV["RACK_TIMEOUT"].to_i if ENV.key?("RACK_TIMEOUT")
