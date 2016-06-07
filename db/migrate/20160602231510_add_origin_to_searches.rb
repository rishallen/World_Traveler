class AddOriginToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :origin, :string
  end
end
