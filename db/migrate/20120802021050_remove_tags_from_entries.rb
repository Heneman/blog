class RemoveTagsFromEntries < ActiveRecord::Migration
  def up
    remove_column :entries, :tags
  end

  def down
    add_column :entries, :tags, :string
  end
end
