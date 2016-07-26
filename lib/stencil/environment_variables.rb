# Please add any configuration keys here that need to be fetched from the config service

module Stencil
  class EnvironmentVariables

    REQUIRED_VARIABLES = [
      'ENV_LABEL',
      'NEWRELIC_LICENSE_KEY'
    ]

    OPTIONAL_VARIABLES = [
      'DEFAULT_SCHEME',
      'DEFAULT_DOMAIN'
    ]

    ALL_VARIABLES = REQUIRED_VARIABLES + OPTIONAL_VARIABLES

    class << self

      def check
        missing_env_vars = REQUIRED_VARIABLES.select { |var| missing? var }

        if !missing_env_vars.empty?
          raise "Missing mandatory environment variables: #{missing_env_vars.join(', ')}"
        end
      end

      private

      def missing?(variable)
        ENV[variable].nil? || ENV[variable] == ''
      end

    end

  end
end
