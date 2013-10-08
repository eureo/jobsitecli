require 'jobsitecli'

require 'fakeweb'

def with_configuration(options = {})
  Jobsitecli.configuration = nil
  Jobsitecli.configure do |configuration|
    options.each do |option, value|
      configuration.send("#{option}=", value)
    end
  end
  yield
end

