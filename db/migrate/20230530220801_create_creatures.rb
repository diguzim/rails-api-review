# frozen_string_literal: true

class CreateCreatures < ActiveRecord::Migration[7.0]
  def up
    create_table(:creatures) do |t|
      t.string(:name)
      t.references(:user, null: true, foreign_key: true)

      t.timestamps
    end
  end

  def down
    drop_table(:creatures)
  end
end
