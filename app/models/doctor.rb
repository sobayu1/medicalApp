class Doctor < ApplicationRecord
  has_one :doctor_information, dependent: :destroy 
  has_many :consultations, dependent: :destroy
  has_many :room_messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
