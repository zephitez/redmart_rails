class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.boolean :completion_status
      t.decimal :final_bill, precision: 10, scale: 2

      t.timestamps
    end
  end
end
