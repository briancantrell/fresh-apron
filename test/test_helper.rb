ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Monban.test_mode!
  # config.after :each do
  #   Monban.test_reset!
  # end
  # config.include Monban::Test::Helpers, type: :feature

  # Add more helper methods to be used by all tests here...
end
