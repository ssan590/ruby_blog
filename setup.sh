#!/bin/bash

echo "🚀 루비온레일즈 학습 블로그 설정을 시작합니다..."

# Ruby 설치 확인
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby가 설치되어 있지 않습니다."
    echo "다음 명령어로 Ruby를 설치해주세요:"
    echo "sudo apt update && sudo apt install -y ruby ruby-dev ruby-bundler build-essential"
    exit 1
fi

echo "✅ Ruby 버전: $(ruby --version)"

# Bundler 설치 확인
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler가 설치되어 있지 않습니다."
    echo "다음 명령어로 Bundler를 설치해주세요:"
    echo "sudo gem install bundler"
    exit 1
fi

echo "✅ Bundler 버전: $(bundle --version)"

# 의존성 설치
echo "📦 Gem 의존성을 설치하고 있습니다..."
bundle install

# 데이터베이스 생성
echo "🗄 데이터베이스를 생성하고 있습니다..."
bin/rails db:create

# 마이그레이션 실행
echo "🔄 데이터베이스 마이그레이션을 실행하고 있습니다..."
bin/rails db:migrate

# 샘플 데이터 생성
echo "🌱 샘플 데이터를 생성하고 있습니다..."
bin/rails db:seed

echo ""
echo "🎉 설정이 완료되었습니다!"
echo ""
echo "다음 명령어로 서버를 실행하세요:"
echo " bin/rails server"
echo ""
echo "브라우저에서 http://localhost:3000 으로 접속하세요."
echo ""
echo "📚 학습을 위해 LEARNING_GUIDE.md 파일을 참고하세요!" 