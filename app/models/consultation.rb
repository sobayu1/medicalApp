class Consultation < ApplicationRecord
  belongs_to :user　,optional: true
  belongs_to :doctor ,optional: true
  has_many :rooms, dependent: :destroy
  validates :user_id, presence: true
  validates :what_symptom, presence: true
  validates :when_symptom, presence: true
  validates :desease_treated, presence: true
  validates :desease_name, presence: true
  validates :specific_consultation, presence: true
end
