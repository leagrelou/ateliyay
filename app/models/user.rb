class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :studios, dependent: :destroy
  has_many :bookings
  has_many :bookings, through: :studios
  has_many :bookings, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => Devise::email_regexp
end
