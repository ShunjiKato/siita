class Draft < ApplicationRecord
  belongs_to :user
  has_one :item
  acts_as_taggable
end
