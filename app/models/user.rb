class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :target_statistics, class_name: 'Statistic', foreign_key: 'target_user_id'
  has_many :observer_statistics, class_name: 'Statistic', foreign_key: 'observer_user_id'
end
