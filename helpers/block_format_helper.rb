# frozen_string_literal: true

module BlockFormatHelper
  def self.indention(level:)
    "\s" * level
  end

  def self.break_line
    "\n"
  end
end
