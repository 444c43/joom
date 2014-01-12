Joom::Application.configure do
  config.cache_classes = true

  config.consider_all_requests_local       = false

  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.compress = true

  config.assets.compile = true

  config.assets.digest = true

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w( home.sass session.sass)

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
end
