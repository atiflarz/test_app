class Profile < ApplicationRecord
  validates_presence_of :first_name, :last_name
  belongs_to :organization, optional: true
end
