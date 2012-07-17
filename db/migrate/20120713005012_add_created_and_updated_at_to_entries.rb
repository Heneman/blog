class AddCreatedAndUpdatedAtToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :created_at, :datetime, :null => false
    add_column :entries, :updated_at, :datetime, :null => false
  end
end
