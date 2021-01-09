class DoctorTag < ApplicationRecord
  belongs_to :doctor
  belongs_to :tag
end
