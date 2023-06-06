# frozen_string_literal: true

class CreateDrops < ActiveRecord::Migration[7.0]
  def up
    create_table(:drops) do |t|
      t.references(:item, null: false, foreign_key: true)
      t.references(:monster, null: false, foreign_key: true)

      t.timestamps
    end
  end

  def down
    drop_table(:drops)
  end
end
