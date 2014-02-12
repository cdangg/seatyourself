class RemoveCategoryFromRestaurant < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :category
  end
end
