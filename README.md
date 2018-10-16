# smi2srtSynology918

smi 자막파일을 ko.srt 로 변환해주는 툴입니다.
이미 존재하는 smi2srt binary 들 중, Synology 918+에서 정상 동작하는 파일을 공유합니다.

# 설치

1. 파일 다운로드
2. 나스의 적당한 위치에 압축 해제
    ex) /volume1/homes/계정명/script/smi2srt
3. 실행권한 부여
    $ cd /volume1/homes/계정명/script/smi2srt ; chmod +x *
4. 스크립트 복사
    $ cp smi2srt.sh /usr/bin/smi2srt




# 스크립트 설명

지정한 경로에서 smi파일을 검색하여, 동일한 파일명의 ko.srt 파일이 없다면 변환 후 smi파일 삭제

targetdir='/volume1/video/해외영화'   > 변경할 경로1

targetdir2='/volume1/video/해외시리즈'  >  변경할 경로2

smidir='/volume1/homes/계정명/script/smi2srt'   >  바이너리를 설치한 위치

기존 smi 파일을 그대로 두고 싶다면, rm -f 라인을 주석처리




# 자동 실행 사용 방법

1. 작업스케쥴러에 사용자 정의 스크립트 등록
2. 특정 시간마다 실행되도록 스케쥴 설정
3. 실행 명령 : sh /volume1/homes/계정명/script/smi2srt/smi2srt.sh




# 수동 실행 방법

1. telnet / ssh 접속 후, smi2srt 입력하여 수동 실행 가능




# 주의사항

잘못 변환이 진행된다면 많은 자막파일이 손상되니 테스트 경로에 자막파일을 가져다두고 시험 후 전체 적용
