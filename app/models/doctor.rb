class Doctor < ApplicationRecord
  has_one :doctor_information, dependent: :destroy 
  has_many :answers, dependent: :destroy
  has_many :rooms
  has_many :room_messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
