class CreatePrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :prizes do |t|
      t.string :name
      t.float :value
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
