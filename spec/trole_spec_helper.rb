require 'rspec'
require 'require_all'
require 'factory_girl'
require 'mocha'
require 'factories'
require 'support/shared_examples'

module Config
  def self.create_role name
    Role.create(name)
  end

  def self.add_roles *names
    names.flatten.each {|n| create_role(n) }
  end
end

RSpec.configure do |config|
  config.mock_with :mocha
end
