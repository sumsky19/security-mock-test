SK쉴더스 모의테스트 v8 - PC ↔ iPhone 중앙DB 연동판

핵심
- 기존 PWA UI/평가기능 유지
- 설정관리 데이터와 평가결과를 Supabase 중앙 DB에 저장
- PC와 iPhone에서 같은 관리자 계정으로 로그인하면 동일 데이터 공유
- 기존 localStorage 데이터가 서버에 없을 때 최초 로그인 시 자동 업로드

설정 순서
1. Supabase 프로젝트 생성
2. SQL Editor에서 supabase-setup.sql 전체 실행
3. Supabase Authentication > Users에서 관리자 이메일/비밀번호 계정 생성
4. Project URL과 anon/publishable key를 backend-config.js에 입력
5. 아래 6개 파일을 GitHub Pages에 덮어쓰기/업로드
   index.html
   backend-config.js
   manifest.webmanifest
   sw.js
   icon-192.png
   icon-512.png
   skshieldus-logo.png
6. PC와 iPhone에서 같은 계정으로 로그인

주의
- backend-config.js에는 anon/publishable key만 사용
- service_role key는 절대 넣지 말 것
- RLS 정책은 로그인한 본인 계정만 자신의 설정/평가결과를 읽고 쓸 수 있게 제한
