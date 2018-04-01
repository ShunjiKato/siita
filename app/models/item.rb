class Item < ApplicationRecord
  belongs_to :user
  belongs_to :draft
  acts_as_taggable
end
