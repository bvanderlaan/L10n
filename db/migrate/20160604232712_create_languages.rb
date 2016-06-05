class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :langname, null: false, limit: 50
      t.string :langcode, null: false, limit: 10

      t.timestamps null: false
    end
  end
end
