# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150420172255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "rodovias", force: :cascade do |t|
    t.string   "br"
    t.string   "uf"
    t.string   "codigo"
    t.string   "local_de_i"
    t.string   "local_de_f"
    t.integer  "km_inicial"
    t.integer  "km_final"
    t.decimal  "extensao",                                                     precision: 8
    t.string   "superficie"
    t.string   "federal_co"
    t.string   "federal__1"
    t.string   "federal__2"
    t.string   "estadual_c"
    t.string   "superfic_1"
    t.string   "mpv_082_20"
    t.string   "concessao_"
    t.geometry "geom",       limit: {:srid=>4676, :type=>"multi_line_string"}
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

end
