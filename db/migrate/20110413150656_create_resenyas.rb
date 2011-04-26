class CreateResenyas < ActiveRecord::Migration
  def self.up
    create_table :resenyas do |t|
      t.integer :restaurant_id
      t.integer :critic_id
      t.decimal :puntuacio
      t.string :comentari

      t.timestamps
    end
  end

  def self.down
    drop_table :resenyas
  end
end
