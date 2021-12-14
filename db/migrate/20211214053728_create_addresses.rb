class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,                         null: false
      t.integer :shipment_source_id,                 null: false
      t.string :municipalities,                      null: false
      t.string :house_number,                        null: false
      t.string :building,                            null: false
      t.string :tel_number,                          null: false
      t.references :purchase,     foreign_key: true, null: false

      t.timestamps
    end
  end
end
