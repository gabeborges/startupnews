class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :url

  has_many :comments, dependent: :destroy
  has_many :votes
end
