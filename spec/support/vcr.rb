require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = File.join(
    File.dirname(__FILE__), '..', 'fixtures', 'vcr'
  )
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
