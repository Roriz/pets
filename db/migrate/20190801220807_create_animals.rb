# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.decimal :month_cost, precision: 20, scale: 2, null: false
      t.integer :kind, null: false
      t.references :person, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
