[SK쉴더스 모의테스트 PWA - PC/아이폰 중앙DB 연동 v10]

Supabase 프로젝트 연결정보가 backend-config.js에 반영된 배포용 파일입니다.

포함 기능
- PC/아이폰 동일 계정 로그인
- 구역/구역유형/평가항목/유형별 평가설정 중앙 저장
- 평가결과 중앙 저장 및 조회/삭제
- 기존 모바일 UI 및 평가 로직 유지
- PWA 및 GitHub Pages 배포 지원

배포
1. GitHub Pages 저장소의 기존 파일을 이 압축파일의 파일로 덮어쓰기
2. backend-config.js는 반드시 함께 업로드
3. Supabase에서 이미 실행한 supabase-setup.sql은 다시 실행할 필요 없음
4. PC/아이폰에서 동일한 Supabase 사용자 계정으로 로그인

주의
- backend-config.js에는 브라우저용 Publishable key만 포함되어 있습니다.
- Secret/service_role key는 포함하지 않습니다.
