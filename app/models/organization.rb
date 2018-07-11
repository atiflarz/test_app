class Organization < ApplicationRecord
  validates_presence_of :org_name
  has_one :profile
  has_one :address
  belongs_to :user, optional: true
  accepts_nested_attributes_for :address, :profile, allow_destroy: true
end
