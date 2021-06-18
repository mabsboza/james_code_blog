class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(5)
    @posts = Post.limit(20).sort_by{ |p| p.score }.reverse
  end

  def profile
    @profile = Account.find_by_user_name(params[:username])
    @posts = @profile.posts
  end
end