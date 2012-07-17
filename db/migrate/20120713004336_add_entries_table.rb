class AddEntriesTable < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.string :title
      t.string :subtitle
      t.string :category
      t.text :post
    end
  end

  def down
    drop_table :entries
  end
end
