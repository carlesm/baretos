class CreateCritics < ActiveRecord::Migration
  def self.up
    create_table :critics do |t|
      t.string :nom
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :critics
  end
end
