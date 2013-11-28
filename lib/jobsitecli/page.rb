module Jobsitecli
  class Page
    include Jobsitecli::ApiCall
  
    attr_accessor :responses

    def initialize
      @responses = []
    end

    def create(params)
      Jobsitecli.debug("PARAMS : #{params}")
      api_call :create_page, :url_options => { :query => { :oldid => params[:page][:old_id] }}, :payload  => params, :failure => :handle_failure, :success => :handle_success
    end

    def delete(old_id)
      api_call :delete_page, :url_options => { :id => old_id }, :failure => :handle_failure
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