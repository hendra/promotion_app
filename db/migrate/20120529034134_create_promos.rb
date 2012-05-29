class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :redemption_details

      t.timestamps
    end
  end
end
