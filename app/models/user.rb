class User < ApplicationRecord
  has_one :profile,dependent: :destroy
  has_many :articles, dependent: :destroy

  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  end