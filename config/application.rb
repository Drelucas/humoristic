require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Humoristic
  class Application < Rails::Application

    config.eager_load_paths += %W(#{config.root}/lib)
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :"pt-BR"
    config.encoding = 'utf-8'

    config.generators do |generate|
      #generate.test_framework :rspec
      generate.stylesheets false
      generate.javascript_engine false
      generate.view_specs false
      generate.helper false
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end

SECRETS = Rails.application.secrets
