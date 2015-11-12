require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Joom
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.compile = true
    config.assets.version = '1.0'
    config.eager_load = true
    config.serve_static_files = true

    config.generators do |g|
      g.test_framework :rspec, fixture: true, views: false
      g.fixture_replacement :fabrication, dir: "spec/fabricators"
      g.integration_tool :rspec
    end
  end
end
