# frozen_string_literal: true

module Config
  COMMANDS = {
    help_command: "'mg -help' command!",
    rails_version_command: "'mg rails -v [VERSION]' command!"
  }.freeze

  ERROR_MESSAGES = {
    invalid_user_input_format: "Invalid format of input, try again or use #{COMMANDS[:help_command]}",
    rails_version_not_specified: "Rails version not specified - use #{COMMANDS[:rails_version_command]}"
  }.freeze

  FORMATS = {
    rails_version: /^\d[.]\d/
  }.freeze

  INDENTS = {
    class: 0,
    method: 2,
    block: 4,
    column: 6,
    timestamp_column: 6
  }.freeze

  class InvalidInputFormatError < StandardError
    def initialize
      super(ERROR_MESSAGES[:invalid_user_input_format])
    end
  end

  class RailsVersionNotSpecifiedError < StandardError
    def initialize
      super(ERROR_MESSAGES[:rails_version_not_specified])
    end
  end
end
