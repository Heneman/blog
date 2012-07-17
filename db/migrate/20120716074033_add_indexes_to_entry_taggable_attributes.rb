class AddIndexesToEntryTaggableAttributes < ActiveRecord::Migration
  def change
    add_index :entries, :category
    add_index :entries, :subcategory
    add_index :entries, :topic
  end
end
