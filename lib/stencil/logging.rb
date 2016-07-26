require 'logger'
require 'stencil/project_root'

# You can access the logger via "Stencil.logger.info ...", or by including it in a class (include Stencil::Logging) and calling "logger.info ..".
# The logger is available for both instance and class methods, as the Logger module extends the class when it is included.

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
