class AddPriceToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :price, :integer
  end
end
