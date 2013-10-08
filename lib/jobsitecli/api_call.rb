module Jobsitecli
  module ApiCall
    def api_call(endpoint, options={})
      api_caller = Jobsitecli::ApiCaller.new(endpoint, options)
      api_caller.call(self)
    end
  end
end
