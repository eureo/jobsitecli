module Jobsitecli
  module ApiCall
    def api_call(endpoint, options={})
      api_caller = Jobsitecli::ApiCaller.new(endpoint, options)
      api_caller.call(self)
    end

    def handle_failure(response)
      Jobsitecli.debug("API CALL FAILED : #{response}")
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
