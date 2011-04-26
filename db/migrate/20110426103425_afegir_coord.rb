class AfegirCoord < ActiveRecord::Migration
  def self.up
        add_column :restaurants, :lat, :float
        add_column :restaurants, :lng, :float
  end

  def self.down
        remove_column :restaurants, :lat
        remove_column :restaurants, :lng
  end
end
