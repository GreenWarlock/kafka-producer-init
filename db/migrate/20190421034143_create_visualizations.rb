class CreateVisualizations < ActiveRecord::Migration[5.2]
  def change
    create_table :visualizations do |t|
      t.references :visualized_user
      t.references :visualizer_user
      t.integer :count
      t.date :date
      t.timestamps
    end

    add_index :visualizations, [:visualized_user_id, :visualizer_user_id], unique: true, name: 'visualizations_index'
  end
end
