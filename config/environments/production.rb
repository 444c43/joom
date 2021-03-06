Joom::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = false
  config.assets.compress = true
  config.assets.compile = true 
  config.assets.digest = true
  config.assets.precompile += %w( home.sass session.sass)
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_level = :info
end
