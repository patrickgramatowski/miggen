# frozen_string_literal: true

RSpec.describe Miggen::MigrationDirector do
  subject { described_class.new(config: config, builder: builder) }

  describe "#build_table_migration" do
    let(:formatted_migration) do
      [
        "class CreateProducts < ActiveRecord::Migration[7.0]\n",
        "  def change\n",
        "    create_table :products do |t|\n",
        "      add_column :products, :price, :integer\n",
        "      add_column :products, :part_number, :string\n",
        "    end\n",
        "  end\n",
        "end\n"
      ]
    end

    context "when config and builder specified" do
      let(:config) do
        {
          exclude_timestamp: true,
          class: { type: :class, content: "class CreateProducts < ActiveRecord::Migration[7.0]" },
          method: { type: :method, content: "def change" },
          block: { type: :block, content: "create_table :products do |t|" },
          columns: {
            type: :column,
            content: ["add_column :products, :part_number, :string", "add_column :products, :price, :integer"]
          }
        }
      end

      let(:builder) { Miggen::TableBuilder }

      it "returns the migration" do
        expect(subject.build_table_migration)
          .to eql(formatted_migration)
      end
    end
  end
end
