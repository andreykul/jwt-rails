# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET_KEY']
  
  # ==> Controller configuration
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  config.mailer_sender = 'no-reply@kp.ca'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # config.params_authenticatable = true
  # config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = false
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 11
  # config.pepper = '1dcf179d22581214058b4d518527525c478403a071f1ce9002b1a53536065d42233261c0f22e2a1b43d4dd1f0e5920316f10ba9a621142ff38a1e4dcc133de00'
  # config.send_email_changed_notification = false
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  config.password_length = 8..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 5
  # config.unlock_in = 1.hour
  config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  # config.reset_password_keys = [:email]
  config.reset_password_within = 1.hour
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  config.navigational_formats = ['*/*', :js]
  config.sign_out_via = :delete

  # ==> OmniAuth
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  config.jwt do |jwt|
    jwt.secret = ENV['JWT_SECRET_KEY']

    jwt.dispatch_requests = [
        ['POST', %r{^/users/sign_in$}]
      ]
  end
end
