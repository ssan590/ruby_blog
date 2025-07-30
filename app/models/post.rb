class Post < ApplicationRecord
  # 유효성 검사 (validation)
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author, presence: true
  
  # 생성일 기준으로 최신순 정렬
  default_scope { order(created_at: :desc) }
  
  # 포스트 요약 메서드 (내용의 처음 100자만 반환)
  def summary
    content.length > 100 ? content[0..100] + "..." : content
  end
end 