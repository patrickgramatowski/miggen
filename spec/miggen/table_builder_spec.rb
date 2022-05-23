# frozen_string_literal: true

RSpec.describe Miggen::TableBuilder do
  subject { described_class.new(config: config) }

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

  describe "#produce_class_definition" do
    let(:produced_class) do
      [
        "class CreateProducts < ActiveRecord::Migration[7.0]\n",
        "end\n"
      ]
    end

    it "returns the formatted class" do
      expect(subject.produce_class_definition)
        .to eql(produced_class)
    end
  end

  describe "#produce_method_definition" do
    let(:produced_method) do
      [
        "  def change\n",
        "  end\n"
      ]
    end

    it "returns the formatted method" do
      expect(subject.produce_method_definition)
        .to eql(produced_method)
    end
  end

  describe "#produce_block_definition" do
    let(:produced_block) do
      [
        "    create_table :products do |t|\n",
        "    end\n"
      ]
    end

    it "returns the formatted block" do
      expect(subject.produce_block_definition)
        .to eql(produced_block)
    end
  end

  describe "#produce_column_definition" do
    let(:produced_columns) do
      [
        "      add_column :products, :price, :integer\n",
        "      add_column :products, :part_number, :string\n"
      ]
    end

    it "returns the formatted columns" do
      expect(subject.produce_column_definition)
        .to eql(produced_columns)
    end
  end
end
