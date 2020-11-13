class Minor < ApplicationRecord
  validates :city, presence: true
  validates :faculty, presence: true
  validates :name, presence: true
  validates :page_url, presence: true
end
