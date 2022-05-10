class AddAddressToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :address, :string
    # remove_column :restaurants, :address, :string

    # add_reference :restaurants, :review, foreign_key: true
    # remove_reference :restaurants, :review, foreign_key: true
  end
end
