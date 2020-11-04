# wwz-dockerfiles


## 프로젝트 구조
### .github
* 깃헙 액션을 모아놓은 디렉토리
### base-image
* WWZ에서 사용하는 기본 베이스 이미지를 빌드하기 위한 도커 파일 명세 모음
* 단일로 동작하지 않는 이미지
### app-image
* base-image를 사용하여 단일 동작읋 하는 명세 모음
* base-image를 사용하지 않는 이미지를 이용해 단일 동작이 가능한 명세 모음
* 공용 인프라 명세 (mysql, redis, zipkin etc)