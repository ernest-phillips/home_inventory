# frozen_string_literal: true

# Application

require_relative 'boot'

require 'rails/all'
# require "active_storage/engine"
# require "active_storage/attached"
# require "active_storage/attached/macros"
# require "active_storage/attached/model"
# require "active_storage/attached/one"
# require "active_storage/attached/many"
require 'bcrypt'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HiBackend
  class Application < Rails::Application # rubocop:todo Style/Documentation
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
