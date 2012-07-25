class CreateEntries < ActiveRecord::Migration
  def change
    create_table  :entries do |t|
      t.string    :title
      t.string    :category
      t.string    :tags
      t.text      :marked_down
      t.text      :marked_up
      
      t.timestamps
    end
  end
end
