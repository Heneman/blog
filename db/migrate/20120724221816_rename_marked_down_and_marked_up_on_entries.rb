class RenameMarkedDownAndMarkedUpOnEntries < ActiveRecord::Migration
  def change
    rename_column :entries, :marked_down, :markdown
    rename_column :entries, :marked_up, :html
  end
end
