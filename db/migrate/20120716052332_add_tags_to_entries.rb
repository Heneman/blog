class AddTagsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :tags, :string

    Entry.all.each do |e|
      e.update_attributes!(:tags => "test")
    end
  end
end
