class Post < ActiveRecord::Base
  after_create :update_rank

  belongs_to :user
  attr_accessible :title, :url, :rank

  has_many :comments, dependent: :destroy
  has_many :votes

 

 def update_rank
	ephoc = DateTime.new(1970, 1, 1)
    date = self.created_at
    td = date - ephoc 
    ranking = td.days * 86400
    self.rank = ranking
   	save
 end

end
