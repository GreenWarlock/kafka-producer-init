class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.references :target_user
      t.references :observer_user
      t.integer :visualizations
      t.date :visualization_date
      t.timestamps
    end

    add_index :statistics, [:target_user_id, :observer_user_id], unique: true
  end
end
