# frozen_string_literal: true

class Settings < RailsSettings::Base
  cache_prefix { 'v1.9.0' }

  field :i18n_updated_at, default: :unknown
  field :log_key_usage, default: false
end
