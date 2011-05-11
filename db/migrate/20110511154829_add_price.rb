class AddPrice < ActiveRecord::Migration
  def self.up
    add_column :films, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :films, :price
  end
end