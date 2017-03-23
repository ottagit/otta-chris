class DropRelationshipsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :relationships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
