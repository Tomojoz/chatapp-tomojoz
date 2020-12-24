class DropTableCards < ActiveRecord::Migration[6.0]
  def change
    drop_table :cards do |t|
      t.bigint "user_id", null: false
      t.bigint "board_id", null: false
      t.string "title"
      t.text "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["board_id"], name: "index_cards_on_board_id"
      t.index ["user_id"], name: "index_cards_on_user_id"
    end
  end
end
