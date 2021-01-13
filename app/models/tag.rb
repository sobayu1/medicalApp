class Tag < ApplicationRecord
    has_many :doctor_tags, dependent: :destroy
    has_many :doctors, through: :doctor_tags
end
