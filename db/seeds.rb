# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# 샘플 블로그 포스트 생성
puts "샘플 포스트를 생성하고 있습니다..."

Post.create!(
  title: "루비온레일즈 시작하기",
  content: "루비온레일즈는 웹 애플리케이션 개발을 위한 강력한 프레임워크입니다. 
  
  이 프레임워크의 주요 특징:
  - Convention over Configuration (설정보다 관례)
  - DRY (Don't Repeat Yourself) 원칙
  - RESTful 아키텍처 지원
  - Active Record를 통한 데이터베이스 추상화
  
  처음 시작할 때는 기본적인 CRUD 작업부터 연습해보는 것이 좋습니다.",
  author: "루비 초보자"
)

Post.create!(
  title: "MVC 패턴 이해하기",
  content: "루비온레일즈는 MVC(Model-View-Controller) 패턴을 기반으로 설계되었습니다.
  
  Model: 데이터와 비즈니스 로직을 담당
  View: 사용자에게 보여지는 화면을 담당  
  Controller: 사용자의 요청을 처리하고 Model과 View를 연결
  
  이 패턴을 이해하면 코드의 구조가 훨씬 명확해집니다.",
  author: "웹 개발자"
)

Post.create!(
  title: "Active Record 기초",
  content: "Active Record는 루비온레일즈의 ORM(Object-Relational Mapping)입니다.
  
  주요 기능:
  - 데이터베이스 테이블을 루비 클래스로 매핑
  - SQL 쿼리를 루비 메서드로 추상화
  - 유효성 검사(Validation) 지원
  - 관계(Association) 설정
  
  예시:
  Post.all # 모든 포스트 조회
  Post.find(1) # ID가 1인 포스트 조회
  Post.where(author: '홍길동') # 조건에 맞는 포스트 조회",
  author: "데이터베이스 전문가"
)

puts "샘플 포스트 생성 완료!"
