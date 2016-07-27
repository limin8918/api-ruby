require File.dirname(__FILE__) + '/config/boot'
require 'stencil'

use Rack::Static, root: 'public', urls: ['/favicon.ico']

map '/' do
  run Stencil::API
end