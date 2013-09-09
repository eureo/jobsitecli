module Jobsitecli
  class Image
    include Jobsitecli::ApiCall
  
    attr_accessor :responses

    def initialize
      @responses = []
    end


    def create(params)
      api_call :create, url_options: { query: { "oldid"=> params[:oldid] }}, payload: params, failure: :handle_failure, success: :handle_success
    end

    def delete(oldid)

    end

    def last_response
      @responses.last
    end
  end
end
