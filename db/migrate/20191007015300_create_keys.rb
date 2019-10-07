class CreateKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :keys do |t|
      t.string :name
      t.string :encrypted_value
      t.string :encrypted_value_iv
      t.timestamps
    end
  end
end
