# frozen_string_literal: true

module Miggen
  class MigrationDirector
    def initialize(config:, builder:)
      @config = config
      @builder = builder.new(config: config)
    end

    def build_table_migration
      builder.produce_timestamp_definition unless config[:exclude_timestamp]
      builder.produce_column_definition
      builder.produce_block_definition
      builder.produce_method_definition
      builder.produce_class_definition
    end

    private

    attr_reader :config, :builder
  end
end
