class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.date :established_at
      t.string :contact_mail
      t.string :city
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
