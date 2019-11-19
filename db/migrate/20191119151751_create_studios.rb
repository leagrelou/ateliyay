class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :category
      t.float :price_per_hour
      t.string :city
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
