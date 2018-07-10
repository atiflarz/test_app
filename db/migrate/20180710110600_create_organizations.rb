class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :org_name
      t.string :org_identifier

      t.timestamps
    end
  end
end
