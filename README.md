# smi2srt-Synology

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
5. axfree 님의 smi2srt 설치

    $ sudo npm install smi2srt -g



# 스크립트 설명

지정한 경로에서 smi파일을 검색하고, 자막 파일 내부에 body 를 포함하는지 확인하여
포함하는 파일과 미포함하는 파일의 리스트를 작성
    
body 를 포함하는 파일은 기존과 동일하게 smi2srt 바이너리를 사용하여 ko.srt 로 변환

body 를 미포함하는 파일은 axfree님의 smi2srt 로 변환
    
동일한 파일명의 ko.srt 파일이 없다면 변환 후 smi파일 삭제

targetdir='/volume1/video/해외영화'   > 변경할 경로1

targetdir2='/volume1/video/해외시리즈'  >  변경할 경로2

smidir='/volume1/homes/계정명/script/smi2srt'   >  바이너리 압축을 해제한 위치

bkupdir='/volume1/log/smi2srt' > 변환하기 전 원본자막을 백업해둘 위치


# 자동 실행 설정 방법
1. 작업스케쥴러에 사용자 정의 스크립트 등록
2. 특정 시간마다 실행되도록 스케쥴 설정
3. 실행 명령 : sh /volume1/homes/계정명/script/smi2srt/smi2srt.sh


# 수동 실행 방법
1. telnet / ssh 접속 후, smi2srt 입력하여 수동 실행 가능


# 주의사항
잘못 변환이 진행된다면 많은 자막파일이 손상되니 테스트 경로에 자막 파일을 가져다두고 시험 후 전체 적용


# 라이센스
George Shuklin

axfree
