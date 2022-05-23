# frozen_string_literal: true

RSpec.describe Miggen::Migration do
  subject { described_class.new }

  describe "#form_block" do
    context "when block's been set" do
      let(:block) { { type: :block, content: "create_table :products do |t|" } }
      let(:formed_block) do
        [
          "    create_table :products do |t|\n",
          "    end\n"
        ]
      end

      before { subject.prepare_block_config(block) }

      it "returns the formed block" do
        expect(subject.form_block).to eql(formed_block)
      end
    end
  end

  describe "#form_columns" do
    context "when columns've been set" do
      let(:columns) do
        {
          type: :column,
          content: [
            "add_column :products, :part_number, :string",
            "add_column :products, :price, :integer"
          ]
        }
      end

      let(:formed_columns) do
        [
          "      add_column :products, :price, :integer\n",
          "      add_column :products, :part_number, :string\n"
        ]
      end

      before { subject.prepare_columns_config(columns) }

      it "returns the formed columns" do
        expect(subject.form_columns).to eql(formed_columns)
      end
    end
  end
end
