Mail.register_interceptor(
  RecipientInterceptor.new(ENV["ALLOWED_EMAIL_RECIPIENTS"])
) if ENV.key?("ALLOWED_EMAIL_RECIPIENTS")
