class CreateTranslatedStrings < ActiveRecord::Migration
  def change
    create_table :translated_strings do |t|
      t.text :translation, null: false
      t.string :comment, null: true
      t.references :root_string, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
