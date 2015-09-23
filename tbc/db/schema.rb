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

ActiveRecord::Schema.define(version: 20150916101711) do

  create_table "conductormobibuses", force: true do |t|
    t.integer "mobibus_id"
    t.integer "conductor_id"
  end

  add_index "conductormobibuses", ["conductor_id"], name: "index_conductormobibuses_on_conductor_id"
  add_index "conductormobibuses", ["mobibus_id"], name: "index_conductormobibuses_on_mobibus_id"

  create_table "conductors", force: true do |t|
    t.string   "nombre"
    t.integer  "cedula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conductortranvia", force: true do |t|
    t.integer "tranvium_id"
    t.integer "conductor_id"
  end

  add_index "conductortranvia", ["conductor_id"], name: "index_conductortranvia_on_conductor_id"
  add_index "conductortranvia", ["tranvium_id"], name: "index_conductortranvia_on_tranvium_id"

  create_table "emergencia", force: true do |t|
    t.integer  "magnitud"
    t.string   "posicion"
    t.string   "tipo_vehiculo"
    t.string   "id_vehiculo"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobibuses", force: true do |t|
    t.string   "posicion"
    t.string   "estado"
    t.string   "kilms_ultima_revision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reportems", force: true do |t|
    t.integer  "mobibus_id"
    t.date     "fecha"
    t.integer  "trayectos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportems", ["mobibus_id"], name: "index_reportems_on_mobibus_id"

  create_table "reportets", force: true do |t|
    t.integer  "tranvium_id"
    t.date     "fecha"
    t.integer  "trayectos"
    t.time     "tiempopromedio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportets", ["tranvium_id"], name: "index_reportets_on_tranvium_id"

  create_table "reservas", force: true do |t|
    t.integer  "usuario_id"
    t.string   "nombreUsuario"
    t.datetime "fecha"
    t.time     "hora_de_salida"
    t.time     "hora_de_llegada"
    t.string   "direccion_salida"
    t.string   "direccion_llegada"
    t.string   "estado"
    t.string   "ruta"
    t.float    "distancia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservas", ["usuario_id"], name: "index_reservas_on_usuario_id"

  create_table "tranvia", force: true do |t|
    t.string   "identificacion"
    t.string   "linea"
    t.float    "kilms_ultima_revision"
    t.float    "temperatura"
    t.string   "posicion"
    t.string   "estado"
    t.boolean  "boton_panico"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "documento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contrasenia"
    t.string   "correo"
  end

  create_table "vcubs", force: true do |t|
    t.string   "posicion"
    t.string   "estado"
    t.boolean  "prestada"
    t.integer  "id_usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
