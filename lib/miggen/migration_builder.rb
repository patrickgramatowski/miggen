# frozen_string_literal: true

require_relative "./migration"

module Miggen
  class MigrationBuilder
    def initialize(config:)
      @config = config
    end

    def produce_class_definition
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def produce_method_definition
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def produce_block_definition
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def produce_column_definition
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def produce_timestamp_column_definition
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    private

    attr_reader :config, :migration
  end
end
