class CreateRootStrings < ActiveRecord::Migration
  def change
    create_table :root_strings do |t|
      t.text :string, null: false
      t.string :comment, null: true

      t.timestamps null: false
    end
  end
end
