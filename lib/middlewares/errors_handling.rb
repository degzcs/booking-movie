class ErrorsHandling
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue => error
      status_code = error.class.to_s =~ /found/i ? 404 : 400
      response(error.class, error.message, status_code, env)
    end
  end

  def error_body(title, status, env, message=nil)
    {
      errors: [
        {
          title: title,
          detail: message || env['sinatra.error'].message,
          status: status.to_s
        }
      ]
    }.to_json
  end

  def response(error_class=StandardError, message=nil, status_code, env)
    title = error_class.to_s.demodulize.underscore.humanize.capitalize
    body = error_body(title, status_code, env, message)
    Rack::Response.new(body, status_code, {}).finish
  end
end

