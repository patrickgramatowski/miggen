# frozen_string_literal: true

require "miggen"

require "miggen/migration_builder"
require "miggen/migration_director"
require "miggen/migration"

require "miggen/table_builder"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
