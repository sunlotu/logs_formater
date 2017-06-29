module LogsFormater
  class Bomb
    def initialize(app)
      @app = app
    end
    def call(env)
      status, headers, body = @app.call(env)
      headers["Lotus"]='Lian'
      [status, headers, body]
    end
  end
end