require File.dirname(__FILE__) + '/config/boot'
require 'stencil/api'

use Rack::Static, root: 'public', urls: ['/favicon.ico']

map '/' do
  run Stencil::API
end