Dir.glob("#{File.expand_path("../config", __FILE__)}/**/*.rb").each { | file | require file }

module Stencil

  module Config

    extend self

    def self.included(base)
      base.extend(self)
    end

    def config
      @@config ||= Object.new.extend(Config)
    end

  end

  def self.config
    Stencil::Config.config
  end

end
