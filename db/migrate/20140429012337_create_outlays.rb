class CreateOutlays < ActiveRecord::Migration
  def change
    create_table :outlays do |t|
      t.integer :amount, null: false
      t.string :note
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
