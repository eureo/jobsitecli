require "jobsitecli/version"
require "jobsitecli/configuration"
require "jobsitecli/routes"
require "jobsitecli/api_caller"
require "jobsitecli/api_call"
require 'jobsitecli/image'
require 'jobsitecli/doc'


module Jobsitecli
  LOG_PREFIX = "** [Jobsitecli] "

  class << self
    attr_accessor :configuration

    def log(message)
      if logger
        logger.info(LOG_PREFIX + message)
      else
        puts(LOG_PREFIX + message)
      end
    end

    def debug(message)
      if logger
        logger.debug(LOG_PREFIX + message)
      else
        puts(LOG_PREFIX + message)
      end
    end

    def logger
      self.configuration && self.configuration.logger
    end

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    def sync
      return true
    end
  end

end
