class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country
      t.string :state
      t.integer :zip
      t.belongs_to :organization, index: true

      t.timestamps
    end
  end
end
