class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :childs, class_name: "Comment", foreign_key: :parent_id

  scope :is_parent, -> { where(parent_id: nil) }
end