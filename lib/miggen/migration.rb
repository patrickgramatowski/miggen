# frozen_string_literal: true

require_relative "../../helpers/block_format_helper"
require_relative "../../config/config"

module Miggen
  class Migration
    include BlockFormatHelper
    include Config

    def initialize
      @migration = []
    end

    def prepare_block_config(block)
      @indention_level = block[:type]
      @block = block
    end

    def prepare_columns_config(columns)
      @indention_level = columns[:type]
      @columns = columns
    end

    def form_block
      migration.unshift(form(block[:content]))
      migration.push(end_tag)
    end

    def form_columns
      # rubocop:disable Lint/RedundantWithObject
      columns[:content].each_with_object(migration) do |column|
        migration.unshift(form(column))
      end
      # rubocop:enable Lint/RedundantWithObject
    end

    private

    attr_reader :migration, :block, :columns, :indention_level

    def indention
      BlockFormatHelper.indention(level: Config::INDENTS[indention_level])
    end

    def break_line
      BlockFormatHelper.break_line
    end

    def form(content)
      indention + content + break_line
    end

    def end_tag
      indention + "end" + break_line
    end
  end
end
