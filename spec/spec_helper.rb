# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  track_files '{lib}/**/*.rb'
  add_filter '/spec/'
  add_filter 'lib/psu_identity/version.rb'
end

require 'bundler/setup'
require 'psu_identity'
require 'rspec/its'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
