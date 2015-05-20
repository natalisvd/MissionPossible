class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :user_to_projects
  has_many :users, :through => :user_to_projects
end
