require_relative 'lib/stencil'

use Rack::Static, root: 'public', urls: ['/favicon.ico']

map '/' do
  run Stencil::API
end