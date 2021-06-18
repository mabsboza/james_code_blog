class VotesController < ApplicationController

  def create
    post_id = params[:post_id]
    is_vote = params[:upvote]
    vote = Vote.new
    vote.post_id = params[:post_id]
    vote.upvote = params[:upvote]
    vote.account_id = current_account.id

    existing_vote = Vote.where(account_id: current_account.id, post_id: post_id)
    @new_vote = existing_vote.size < 1

    respond_to do |format|
      format.js {
        if existing_vote.size > 0
          existing_vote.first.destroy
        else
          if vote.save
            @success = true
          else
            @success = false
          end
          # @total_upvotes = @post.upvotes
          # @total_downvotes = @post.downvotes
        end
        @post = Post.find(post_id)
        @is_upvote = params[:upvote]
        render "votes/create"
      }
    end
  end

  private

  def vote_params
    params.required(:vote).permit(:upvote, :post_id, )
  end
end