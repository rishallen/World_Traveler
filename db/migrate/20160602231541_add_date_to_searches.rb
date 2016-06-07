class AddDateToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :date, :string
  end
end
