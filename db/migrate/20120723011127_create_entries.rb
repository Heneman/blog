class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :subcategory
      t.string :topic
      t.text :markdown
      t.text :html
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
