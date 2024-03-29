# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :document, null: false
      t.date :birthdate, null: false

      t.timestamps
    end
  end
end
