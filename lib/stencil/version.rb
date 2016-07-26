require_relative 'project_root'

module Stencil

  # if building a new package, create a new version, else read from VERSION file
  proposed_new_version = "0.0." + ENV.fetch('BAMBOO_BUILD_VERSION', '0')
  version_file = Stencil.project_root.join('VERSION')
  VERSION = File.exists?(version_file) ? File.read(version_file).chomp : proposed_new_version

end