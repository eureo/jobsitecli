module Jobsitecli
  module Routes

    def create_endpoint(options)
      [:post, create_url(options)]
    end

    def create_url(options)
      url = http_scheme.build(base_options.merge(path: create_path))
      url.query = options[:query].map { |k,v| "#{k}=#{v}" }.join('&') if options[:query]
      url.to_s
    end

    def delete_endpoint(options)
      [:delete, delete_url(options)]
    end

    def delete_url(options)
      url = http_scheme.build(base_options.merge(path: delete_path(options[:id])))
      url.query = options[:query].map { |k,v| "#{k}=#{v}" }.join('&') if options[:query]
      url.to_s
    end

    protected

    def http_scheme
      if Jobsitecli.configuration.secure
        URI::HTTPS
      else
        URI::HTTP
      end
    end

    def base_options
      options = { host: Jobsitecli.configuration.host, port: Jobsitecli.configuration.port.to_i }
      options
    end

    def create_path
      path = "/api/v1/images"
      path
    end

    def delete_path(id)
      path = "/api/v1/images/#{id}/destroy_by_oldid"
      path
    end

  end
end

