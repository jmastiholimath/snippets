class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :description
      t.boolean :private

      t.timestamps null: false
    end
  end
end
