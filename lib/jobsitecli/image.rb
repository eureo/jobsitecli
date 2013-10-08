module Jobsitecli
  class Image
    include Jobsitecli::ApiCall
  
    attr_accessor :responses

    def initialize
      @responses = []
    end

    def create(params)
      #Jobsitecli.debug("PARAMS : #{params}")
      api_call :create, url_options: { query: { oldid: params[:image][:oldid] }}, payload: params, failure: :handle_failure, success: :handle_success
    end

    def delete(oldid)
      api_call :delete, url_options: { id: oldid }, failure: :handle_failure
    end

    def handle_failure(response)
      #Jobsitecli.debug("API CALL FAILED : #{response}")
      @responses << response
    end

    def handle_success(response)
      @responses << response
    end            

    def last_response
      @responses.last
    end
  end
end
