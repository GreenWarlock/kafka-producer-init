class Statistic < ApplicationRecord
  belongs_to :target_user, class_name: 'User'
  belongs_to :observer_user, class_name: 'User'
end
