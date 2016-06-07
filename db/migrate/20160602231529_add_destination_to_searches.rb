class AddDestinationToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :destination, :string
  end
end
