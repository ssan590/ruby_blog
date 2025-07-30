class HomeController < ApplicationController
  def index
    # 최근 포스트 3개만 가져오기
    @recent_posts = Post.limit(3)
    @total_posts = Post.count
  end
end 