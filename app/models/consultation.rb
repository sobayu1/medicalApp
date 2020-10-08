class Consultation < ApplicationRecord
  belongs_to :user　,optional: true
  validates :user_id, presence: true
  validates :what_symptom, presence: true
  validates :when_symptom, presence: true
  validates :desease_treated, presence: true
  validates :desease_name, presence: true
  validates :specific_consultation, presence: true
  has_many :answers, dependent: :destroy
  
end
