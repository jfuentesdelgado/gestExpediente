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

ActiveRecord::Schema.define(version: 20140311182739) do

  create_table "barcos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mercancias", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registros", force: true do |t|
    t.integer  "numero",            limit: 255, null: false
    t.string   "tipo",              limit: 1,   null: false
    t.date     "fecha",                         null: false
    t.time     "hora",                          null: false
    t.integer  "cliente_id",                    null: false
    t.integer  "bultos",                        null: false
    t.integer  "mercancia_id",                  null: false
    t.string   "matriculaCamion",               null: false
    t.string   "matriculaRemolque",             null: false
    t.integer  "pesoneto",                      null: false
    t.integer  "pesobruto",                     null: false
    t.string   "procedencia",                   null: false
    t.integer  "transitario_id",                null: false
    t.integer  "barco_id",                      null: false
    t.string   "conocimiento",                  null: false
    t.string   "precinto1"
    t.string   "precinto2"
    t.string   "precinto3"
    t.string   "flete",                         null: false
    t.integer  "total",                         null: false
    t.string   "estado",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
  end

  create_table "transitarios", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
