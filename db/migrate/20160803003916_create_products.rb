class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :picture
      t.string :name, unique: true
      t.decimal :price, null: false, precision: 10, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
