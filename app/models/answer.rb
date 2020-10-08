class Answer < ApplicationRecord
  belongs_to :doctor
  belongs_to :consultation
end
