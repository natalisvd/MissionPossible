class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :owner, class_name: User, foreign_key: :owner_id
  belongs_to :requester, class_name: User, foreign_key: :requester_id
  belongs_to :parent, :class_name => Task, :foreign_key => "parent_id"
  has_many :children, :class_name => Task, :foreign_key => "parent_id"
end
