class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :consultation
end
