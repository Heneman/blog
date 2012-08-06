class AddIndexOnEntriesSlug < ActiveRecord::Migration
  def up
    add_index :entries, :slug, :unique => true
  end

  def down
    remove_index :entries, :slug
  end
end
