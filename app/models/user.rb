class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :visualized_statistics, class_name: 'Visualization', foreign_key: 'visualized_user_id'
  has_many :visualizer_statistics, class_name: 'Visualization', foreign_key: 'visualizer_user_id'
  has_many :articles, foreign_key: :author_id

  validates_uniqueness_of :email
end
