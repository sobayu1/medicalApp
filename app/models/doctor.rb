class Doctor < ApplicationRecord
  has_one :doctor_information, dependent: :destroy 
  has_many :consultations, dependent: :destroy
  has_many :room_messages, dependent: :destroy
  has_many :doctor_tags, dependent: :destroy
  has_many :tags, through: :doctor_tags
  ratyrate_rateable "doctor"
  # accepts_nested_attributes_for :doctor_tags, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :image

mount_uploader :image, ImageUploader
end
