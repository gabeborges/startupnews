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
  	end

	def vote_up
	  post = Post.find(params[:id])
	  vote = post.rank 
	  vote += 2800
	  #vote = Vote.create(params[:vote][:up])
	  #vote.post = post
	  #vote.save
	  vote.save
	end
	
	def vote_down
	  post = Post.find(params[:id])
	  post.rank -= 2800
	  vote = Vote.create(params[:vote][:id])
	  vote.post = post
	  vote.save
	  post.save
	end

end
