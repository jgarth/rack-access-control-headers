module Rack
  class AccessControlHeaders
    def initialize(app, path, origin = "*")
      @app = app
      @path = path
      @origin = origin
    end

    def call(env)
      response = @app.call(env)
      if env["PATH_INFO"].match @path
        response[1]["Access-Control-Allow-Origin"] = @origin
        response[1]["Access-Control-Allow-Headers"] = 'X-Requested-With, Authorization, X-SproutCore-Version, Content-Type, Location'
        response[1]['Access-Control-Allow-Methods'] = 'INDEX, GET, POST, PUT, PATCH, DELETE'
        response[1]['Access-Control-Request-Methods'] = '*'
        response[1]["Expires"] = '1278000'
      end
      response
    end
  end
end
