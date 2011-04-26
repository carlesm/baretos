# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110413150656) do

  create_table "critics", :force => true do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resenyas", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "critic_id"
    t.integer  "puntuacio",     :limit => 10, :precision => 10, :scale => 0
    t.string   "comentari"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "nom"
    t.string   "adreca"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
