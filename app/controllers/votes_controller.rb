class VotesController < ApplicationController
	before_filter :authenticate_user!
	def create
   	@vote = Vote.where(:post_id => params[:vote][:post_id], :user_id => current_user.id).first
		if @vote
		  @vote.up = params[:vote][:up]
		  @vote.save
		else
		  @vote = current_user.votes.create(params[:vote])
		end
		redirect_to :back

  

    #@post = Post.find(params[:post_id])
    #@vote = @post.votes.create(params[:vote])
    #@vote.user_id = current_user.id
    #@vote.save
    #redirect_to :back
  end


end
