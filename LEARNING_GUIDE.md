# 루비온레일즈 학습 가이드

이 문서는 루비온레일즈를 처음 배우는 개발자를 위한 단계별 학습 가이드입니다.

## 📋 목차

1. [루비온레일즈 소개](#루비온레일즈-소개)
2. [프로젝트 구조 이해하기](#프로젝트-구조-이해하기)
3. [MVC 패턴 학습](#mvc-패턴-학습)
4. [Active Record 기초](#active-record-기초)
5. [라우팅 이해하기](#라우팅-이해하기)
6. [폼 처리와 유효성 검사](#폼-처리와-유효성-검사)
7. [실습 과제](#실습-과제)

## 🎯 루비온레일즈 소개

### 루비온레일즈란?
루비온레일즈(Ruby on Rails)는 루비 언어로 작성된 웹 애플리케이션 프레임워크입니다.

### 주요 특징
- **Convention over Configuration**: 설정보다 관례를 우선시
- **DRY (Don't Repeat Yourself)**: 코드 중복을 피함
- **MVC 패턴**: Model-View-Controller 아키텍처
- **Active Record**: ORM(Object-Relational Mapping) 패턴

### 철학
1. **설정보다 관례**: 파일명, 폴더명, 클래스명의 규칙을 따름
2. **DRY**: 같은 코드를 반복하지 않음
3. **RESTful**: 표준적인 웹 아키텍처 패턴 사용

## 🏗 프로젝트 구조 이해하기

```
myapp/
├── app/                    # 애플리케이션 코드
│   ├── controllers/        # 컨트롤러 (요청 처리)
│   ├── models/            # 모델 (데이터와 비즈니스 로직)
│   ├── views/             # 뷰 (사용자 인터페이스)
│   └── helpers/           # 헬퍼 (뷰에서 사용하는 메서드)
├── config/                # 설정 파일들
│   ├── routes.rb          # 라우팅 설정
│   └── database.yml       # 데이터베이스 설정
├── db/                    # 데이터베이스 관련
│   ├── migrate/           # 마이그레이션 파일들
│   └── seeds.rb           # 샘플 데이터
└── public/                # 정적 파일들 (CSS, JS, 이미지)
```

## 🎭 MVC 패턴 학습

### Model (모델)
- **역할**: 데이터와 비즈니스 로직을 담당
- **위치**: `app/models/`
- **예시**: `Post` 클래스

```ruby
class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  
  def summary
    content[0..100] + "..."
  end
end
```

### View (뷰)
- **역할**: 사용자에게 보여지는 화면
- **위치**: `app/views/`
- **예시**: `posts/index.html.erb`

```erb
<% @posts.each do |post| %>
  <h2><%= post.title %></h2>
  <p><%= post.summary %></p>
<% end %>
```

### Controller (컨트롤러)
- **역할**: 사용자 요청을 처리하고 Model과 View를 연결
- **위치**: `app/controllers/`
- **예시**: `PostsController`

```ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
```

## 🗄 Active Record 기초

### Active Record란?
Active Record는 루비온레일즈의 ORM(Object-Relational Mapping)입니다.

### 기본 CRUD 작업

#### Create (생성)
```ruby
# 방법 1: new + save
post = Post.new(title: "제목", content: "내용", author: "작성자")
post.save

# 방법 2: create (한 번에)
Post.create(title: "제목", content: "내용", author: "작성자")
```

#### Read (읽기)
```ruby
# 모든 포스트
Post.all

# 특정 ID의 포스트
Post.find(1)

# 조건에 맞는 포스트
Post.where(author: "홍길동")
Post.find_by(title: "제목")

# 첫 번째/마지막 포스트
Post.first
Post.last
```

#### Update (수정)
```ruby
# 방법 1: 속성 변경 후 저장
post = Post.find(1)
post.title = "새 제목"
post.save

# 방법 2: update (한 번에)
post = Post.find(1)
post.update(title: "새 제목", content: "새 내용")
```

#### Delete (삭제)
```ruby
post = Post.find(1)
post.destroy
```

### 유효성 검사 (Validation)
```ruby
class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author, presence: true
end
```

## 🛣 라우팅 이해하기

### 라우팅이란?
URL과 컨트롤러 액션을 연결하는 규칙입니다.

### RESTful 라우트
```ruby
# config/routes.rb
resources :posts
```

이 한 줄로 다음 라우트들이 자동 생성됩니다:

| HTTP 메서드 | URL | 컨트롤러 액션 | 설명 |
|------------|-----|-------------|------|
| GET | /posts | index | 포스트 목록 |
| GET | /posts/new | new | 새 포스트 폼 |
| POST | /posts | create | 포스트 생성 |
| GET | /posts/:id | show | 포스트 상세 |
| GET | /posts/:id/edit | edit | 포스트 수정 폼 |
| PATCH/PUT | /posts/:id | update | 포스트 수정 |
| DELETE | /posts/:id | destroy | 포스트 삭제 |

### 라우트 확인하기
```bash
bin/rails routes
```

## 📝 폼 처리와 유효성 검사

### 폼 생성
```erb
<%= form_with(model: @post, local: true) do |form| %>
  <%= form.label :title, "제목" %>
  <%= form.text_field :title %>
  
  <%= form.label :content, "내용" %>
  <%= form.text_area :content %>
  
  <%= form.submit "저장" %>
<% end %>
```

### 컨트롤러에서 처리
```ruby
def create
  @post = Post.new(post_params)
  
  if @post.save
    redirect_to @post, notice: '성공적으로 생성되었습니다!'
  else
    render :new, status: :unprocessable_entity
  end
end

private

def post_params
  params.require(:post).permit(:title, :content, :author)
end
```

### 에러 표시
```erb
<% if @post.errors.any? %>
  <div class="error-messages">
    <h2><%= pluralize(@post.errors.count, "error") %>가 발생했습니다:</h2>
    <ul>
      <% @post.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
```

## 🎯 실습 과제

### 1단계: 기본 CRUD 완성하기
1. 포스트 목록 페이지 만들기
2. 새 포스트 작성 기능
3. 포스트 상세 보기
4. 포스트 수정 기능
5. 포스트 삭제 기능

### 2단계: 기능 확장하기
1. 포스트 검색 기능 추가
2. 포스트 카테고리 분류
3. 작성일 기준 정렬 기능
4. 페이지네이션 추가

### 3단계: 고급 기능
1. 사용자 인증 시스템
2. 댓글 기능
3. 이미지 업로드
4. API 개발

## 🔧 개발 도구 활용

### Rails 콘솔
```bash
bin/rails console
```
```ruby
# 데이터베이스 조작 연습
Post.all
Post.create(title: "테스트", content: "내용", author: "작성자")
```

### 로그 확인
```bash
tail -f log/development.log
```

### 라우트 확인
```bash
bin/rails routes
```

### 데이터베이스 리셋
```bash
bin/rails db:reset
```

## 📚 추가 학습 자료

### 공식 문서
- [Rails Guides](https://guides.rubyonrails.org/)
- [Rails API Documentation](https://api.rubyonrails.org/)

### 추천 도서
- "Agile Web Development with Rails" (Sam Ruby)
- "Rails 5 Test Prescriptions" (Noel Rappin)

### 온라인 강의
- Rails Tutorial (Michael Hartl)
- GoRails
- RailsCasts

## 🚀 다음 단계

이 기본 프로젝트를 완성한 후:

1. **실제 프로젝트 만들기**: 자신만의 아이디어로 프로젝트 시작
2. **고급 기능 학습**: API, 배포, 성능 최적화
3. **테스트 작성**: RSpec, Capybara 학습
4. **커뮤니티 참여**: Rails 커뮤니티 활동

---

**행복한 코딩 되세요! 🎉** 