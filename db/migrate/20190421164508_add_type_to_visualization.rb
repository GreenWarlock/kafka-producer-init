class AddTypeToVisualization < ActiveRecord::Migration[5.2]
  def change
    add_column :visualizations, :type, :integer, default: 0
  end
end
