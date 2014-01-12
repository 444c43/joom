require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNJoomLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNJoomLE_GEMFILE'])
