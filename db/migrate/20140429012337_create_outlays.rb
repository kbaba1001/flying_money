class CreateOutlays < ActiveRecord::Migration
  def change
    create_table :outlays do |t|
      t.integer :amount
      t.string :note
      t.references :user, index: true

      t.timestamps
    end
  end
end
