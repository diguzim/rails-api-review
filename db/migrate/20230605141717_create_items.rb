# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def up
    create_table(:items) do |t|
      t.string(:name)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end

  def down
    drop_table(:items)
  end
end
