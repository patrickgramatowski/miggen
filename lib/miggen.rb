# frozen_string_literal: true

require_relative "miggen/version"
require_relative "miggen/table_builder"
require_relative "miggen/migration_director"

module Miggen
  class Miggen
    def self.build_table_migration(builder:, config:)
      MigrationDirector.new(config: config, builder: builder)
                       .build_table_migration
                       .join
    end
  end
end
