module Jobsitecli
  class Doc
    include Jobsitecli::ApiCall
  
    attr_accessor :responses

    def initialize
      @responses = []
    end

    def create(params)
      Jobsitecli.debug("PARAMS : #{params}")
      api_call :create_doc, :url_options => { :query => { :oldid => params[:doc][:oldid] }}, :payload  => params, :failure => :handle_failure, :success => :handle_success
    end

    def delete(oldid)
      api_call :delete_doc, :url_options => { :id => oldid }, :failure => :handle_failure
    end

  end
end
