class ChangeEntryTagsToSubcategory < ActiveRecord::Migration
  def change
    rename_column :entries, :tags, :subcategory
  end
end
