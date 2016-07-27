require 'logger'
require 'project_root'

module Stencil

  module Logging

    LOG_DIR = Stencil.project_root.join('log').cleanpath
    LOG_FILE_NAME = "#{ENV.fetch('RACK_ENV','development')}.log"

    def self.included(base)
      base.extend(self)
    end

    def logger
      @@logger ||= begin
        FileUtils.mkdir_p(LOG_DIR)
        logger = Logger.new(File.join(LOG_DIR, LOG_FILE_NAME))
        logger.level = Logger::DEBUG
        logger
      end
    end
  end

  include Logging
end
