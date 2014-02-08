class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :num_of_customers
      t.datetime :day
      t.string :restaurant_id
      t.string :customer_id

      t.timestamps
    end
  end
end
