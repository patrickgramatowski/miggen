# frozen_string_literal: true

require_relative "./migration_builder"

module Miggen
  class TableBuilder < MigrationBuilder
    def initialize(config:)
      super(config: config)
      reset
    end

    def produce_class_definition
      migration.prepare_block_config(config[:class])
      migration.form_block
    end

    def produce_method_definition
      migration.prepare_block_config(config[:method])
      migration.form_block
    end

    def produce_block_definition
      migration.prepare_block_config(config[:block])
      migration.form_block
    end

    def produce_column_definition
      migration.prepare_columns_config(config[:columns])
      migration.form_columns
    end

    def produce_timestamp_column_definition
      migration.prepare_columns_config(config[:timestamp_column])
      migration.form_columns
    end

    private

    def reset
      @migration = Migration.new
    end

    attr_reader :config, :migration
  end
end
