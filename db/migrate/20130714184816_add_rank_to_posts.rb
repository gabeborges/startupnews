class AddRankToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rank, :integer
  end
end
