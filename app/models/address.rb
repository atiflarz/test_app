class Address < ApplicationRecord
  validates_presence_of :line1, :country, :city, :zip
  validates_length_of :zip, minimum: 6, maximum: 6
  belongs_to :organization, optional: true
end
