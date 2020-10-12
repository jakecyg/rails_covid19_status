class CreatePrimaryMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :primary_metrics do |t|
      t.integer :confirmed
      t.integer :deaths
      t.integer :recovered
      t.integer :active
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
