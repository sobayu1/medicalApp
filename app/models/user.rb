class User < ApplicationRecord
has_one :user_information, dependent: :destroy 
has_many :consultations, dependent: :destroy
has_many :room_messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :image

mount_uploader :image, ImageUploader

end
