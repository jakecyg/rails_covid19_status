class CreateSecondaryMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :secondary_metrics do |t|
      t.integer :deathPerHundred
      t.integer :recoveredPerHundred
      t.integer :deathPerHundredRecovered
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
