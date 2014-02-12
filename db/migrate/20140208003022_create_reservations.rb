class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :num_of_customers
      t.datetime :day
      t.integer :restaurant_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
