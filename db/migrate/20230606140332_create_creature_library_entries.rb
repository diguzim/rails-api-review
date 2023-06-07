# frozen_string_literal: true

class CreateCreatureLibraryEntries < ActiveRecord::Migration[7.0]
  def up
    create_table(:creature_library_entries) do |t|
      t.references(:creature, null: false, foreign_key: true)
      t.text(:description)
      t.string(:race)
      t.string(:pluralized_name)

      t.timestamps
    end
  end

  def down
    drop_table(:creature_library_entries)
  end
end
