class PostsController < ApplicationController
  # 모든 액션에서 @post 변수를 설정하는 메서드
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # 모든 포스트 목록 보기
  def index
    @posts = Post.all
  end
  
  # 개별 포스트 보기
  def show
  end
  
  # 새 포스트 작성 폼
  def new
    @post = Post.new
  end
  
  # 새 포스트 생성
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post, notice: '포스트가 성공적으로 생성되었습니다!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # 포스트 수정 폼
  def edit
  end
  
  # 포스트 수정
  def update
    if @post.update(post_params)
      redirect_to @post, notice: '포스트가 성공적으로 수정되었습니다!'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  # 포스트 삭제
  def destroy
    @post.destroy
    redirect_to posts_url, notice: '포스트가 성공적으로 삭제되었습니다!'
  end
  
  private
  
  # 특정 포스트 찾기
  def set_post
    @post = Post.find(params[:id])
  end
  
  # 허용된 파라미터만 받기 (보안)
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end 