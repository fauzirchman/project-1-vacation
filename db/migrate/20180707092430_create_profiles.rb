class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.text :address
      t.string :phone
      t.string :location

      t.timestamps
    end
  end
end
