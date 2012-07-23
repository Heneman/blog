class RemoveDescriptionFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :description
  end
end
