class Comment < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
  validates_presence_of :user, :film, :text
end
