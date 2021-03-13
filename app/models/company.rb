class Company < ApplicationRecord
  has_many :sheet_uploads, dependent: :destroy
  has_many :time_series, dependent: :destroy
end
