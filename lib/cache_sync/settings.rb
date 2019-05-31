# frozen_string_literal: true

require 'cache_sync/cache'

module CacheSync
  class Settings < Cache
    def read_version
      ::Settings.i18n_updated_at
      # query = "SELECT value FROM settings WHERE var='i18n_updated_at' LIMIT 1"
      # ActiveRecord::Base.connection.execute(query).first['value']
    end

    def write_version(version)
      ::Settings.i18n_updated_at = version
      # query = "UPDATE settings SET value='#{version}' WHERE var='i18n_updated_at'"
      # ActiveRecord::Base.connection.execute(query)
    end

    def cache_set_up
      ActiveRecord::Base.connection.data_source_exists?('settings')
    end
  end
end
