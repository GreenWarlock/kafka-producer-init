class Visualization < ApplicationRecord
  belongs_to :visualized_user, class_name: 'User'
  belongs_to :visualizer_user, class_name: 'User'

  enum type: %i[profile article]
end
