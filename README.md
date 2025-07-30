# 루비온레일즈 학습 블로그

루비온레일즈를 처음 배우는 개발자를 위한 간단한 블로그 애플리케이션입니다.

## 🎯 프로젝트 목표

이 프로젝트는 루비온레일즈의 기본 개념들을 학습할 수 있도록 설계되었습니다:

- **MVC 패턴**: Model, View, Controller의 역할과 관계
- **Active Record**: 데이터베이스 조작과 ORM
- **라우팅**: URL과 컨트롤러 액션의 연결
- **폼 처리**: 사용자 입력 처리와 유효성 검사
- **RESTful 설계**: 표준적인 웹 애플리케이션 구조

## 🚀 시작하기

### 필수 요구사항

- Ruby 3.0 이상
- Rails 8.0 이상
- SQLite3

### 설치 및 실행

1. **의존성 설치**
   ```bash
   bundle install
   ```

2. **데이터베이스 생성 및 마이그레이션**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

3. **샘플 데이터 생성**
   ```bash
   bin/rails db:seed
   ```

4. **서버 실행**
   ```bash
   bin/rails server
   ```

5. **브라우저에서 확인**
   ```
   http://localhost:3000
   ```

## 📚 학습 내용

### 1. 모델 (Model)
- `app/models/post.rb`: 블로그 포스트 모델
- 유효성 검사 (Validation)
- 기본 스코프 (Default Scope)
- 커스텀 메서드

### 2. 컨트롤러 (Controller)
- `app/controllers/posts_controller.rb`: 포스트 관리 컨트롤러
- `app/controllers/home_controller.rb`: 홈페이지 컨트롤러
- CRUD 액션 (Create, Read, Update, Delete)
- before_action 콜백

### 3. 뷰 (View)
- ERB 템플릿 사용
- Tailwind CSS로 스타일링
- 폼 처리와 에러 표시
- 링크와 네비게이션

### 4. 라우팅
- `config/routes.rb`: URL 라우팅 설정
- RESTful 리소스 라우트
- 루트 경로 설정

### 5. 데이터베이스
- `db/migrate/`: 마이그레이션 파일
- `db/seeds.rb`: 샘플 데이터
- 인덱스 설정

## 🛠 주요 기능

- ✅ 블로그 포스트 목록 보기
- ✅ 새 포스트 작성
- ✅ 포스트 상세 보기
- ✅ 포스트 수정
- ✅ 포스트 삭제
- ✅ 홈페이지 대시보드
- ✅ 반응형 디자인

## 📖 루비온레일즈 개념 설명

### MVC 패턴
- **Model**: 데이터와 비즈니스 로직 (`Post` 클래스)
- **View**: 사용자 인터페이스 (ERB 템플릿)
- **Controller**: 요청 처리와 조정 (`PostsController`)

### Active Record
- ORM(Object-Relational Mapping) 패턴
- 데이터베이스 테이블을 루비 객체로 매핑
- SQL 쿼리를 루비 메서드로 추상화

### Convention over Configuration
- 파일명과 클래스명의 규칙
- 폴더 구조의 표준화
- 설정보다 관례를 우선시

## 🔧 개발 팁

1. **콘솔 사용하기**
   ```bash
   bin/rails console
   ```
   ```ruby
   Post.all
   Post.create(title: "테스트", content: "내용", author: "작성자")
   ```

2. **라우트 확인하기**
   ```bash
   bin/rails routes
   ```

3. **로그 확인하기**
   ```bash
   tail -f log/development.log
   ```

## 📝 다음 단계

이 기본 프로젝트를 완성한 후, 다음과 같은 기능들을 추가해볼 수 있습니다:

- 사용자 인증 (Devise)
- 댓글 시스템
- 카테고리 분류
- 이미지 업로드
- 검색 기능
- API 개발

## 🤝 기여하기

이 프로젝트는 학습 목적으로 만들어졌습니다. 개선사항이나 버그 리포트는 언제든 환영합니다!

---

**Happy Coding! 🎉**
