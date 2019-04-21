class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, presence: true,
            length: { minimum: 5 }
  validates_presence_of :author
end
