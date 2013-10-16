module Jobsitecli
  module Routes

    def create_image_endpoint(options)
      [:post, create_image_url(options)]
    end

    def create_image_url(options)
      url = http_scheme.build(base_options.merge(:path => create_image_path))
      url.query = options[:query].map { |k,v| "#{k}=#{v}" }.join('&') if options[:query]
      url.to_s
    end

    def delete_image_endpoint(options)
      [:delete, delete_image_url(options)]
    end

    def delete_image_url(options)
      url = http_scheme.build(base_options.merge(:path => delete_image_path(options[:id])))
      url.query = options[:query].map { |k,v| "#{k}=#{v}" }.join('&') if options[:query]
      url.to_s
    end

    def create_doc_endpoint(options)
      [:post, create_doc_url(options)]
    end

    def create_doc_url(options)
      url = http_scheme.build(base_options.merge(:path => create_doc_path))
      url.query = options[:query].map { |k,v| "#{k}=#{v}" }.join('&') if options[:query]
      url.to_s
    end

    def delete_doc_endpoint(options)
      [:delete, delete_doc_url(options)]
    end

    def delete_doc_url(options)
      url = http_scheme.build(base_options.merge(:path => delete_doc_path(options[:id])))
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
      options = { :host => Jobsitecli.configuration.host, :port => Jobsitecli.configuration.port.to_i }
      options
    end

    def create_image_path
      path = "/api/v1/images"
      path
    end

    def delete_image_path(id)
      path = "/api/v1/images/#{id}"
      path
    end

    def create_doc_path
      path = "/api/v1/docs"
      path
    end

    def delete_doc_path(id)
      path = "/api/v1/docs/#{id}"
      path
    end
  end
end

