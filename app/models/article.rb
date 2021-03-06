class Article < ApplicationRecord

  belongs_to :user,optional: true

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true

end
