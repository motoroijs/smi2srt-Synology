# smi2srt-Synology

smi 자막파일을 ko.srt 로 변환하고, charset 을 UTF-8로 해주는 툴입니다.

프로그램하는 사람이 아니다보니 스크립트가 너저분하지만, 누군가에겐 소중한 정보일수 있으니 공개해둡니다.

# 설치

1. 파일 다운로드

2. 나스의 적당한 위치에 압축 해제

    ex) /volume1/homes/계정명/script/smi2srt
    
3. 실행권한 부여

    $ cd /volume1/homes/계정명/script/smi2srt ; chmod +x *
    
4. 스크립트 복사

    $ cp smi2srt.sh /usr/bin/smi2srt
    
5. 원본 백업 경로 생성

   $ mkdir -p /volume1/log/smi2srt

6. axfree 님의 smi2srt 설치

    $ sudo npm install smi2srt -g

7. chartdect 설치

   $ sudo pip install chardet
   
   $ /usr/lib/python2.7/site-packages/chardet/cli/chardetect.py 파일의 81번 라인 변경
   
   print(description_of(f, f.name)) >> print(description_of(f))
   
8. piconv 설치

시놀로지 패키지 센터에서 perl 설치후 링크 생성

   $ ln -s "/volume1/@appstore/Perl/usr/local/bin/piconv" "/usr/local/bin/piconv"


# 스크립트 설명

지정한 경로에서 smi파일을 검색하고, 자막 파일 내부에 body 를 포함하는지 확인하여

포함하는 파일과 미포함하는 파일의 리스트를 작성
    
body 를 포함하는 파일은 George Shuklin 님의 smi2srt 바이너리를 사용하여 ko.srt 로 변환

body 를 미포함하는 파일은 axfree님의 smi2srt 로 변환
    
동일한 파일명의 ko.srt 파일이 존재한다면 변환하지 않고 skip

동일한 파일명의 ko.srt가 없다면 변환 후 smi파일을 bkupdir 로 이동하여 원본 백업

targetdir='/volume1/video/해외영화'   > 변경할 경로1

targetdir2='/volume1/video/해외시리즈'  >  변경할 경로2

smidir='/volume1/homes/계정명/script/smi2srt'   >  바이너리 압축을 해제한 위치

bkupdir='/volume1/log/smi2srt' > 변환하기 전 원본자막을 백업해둘 위치

자막 깨짐을 방지하기 위해, ko.srt로 변환이 완료된 파일의 charset 을 확인하여 UTF-8 이 아니라면 UTF-8로 변환하는 기능 추가


# 자동 실행 설정 방법
1. 작업스케쥴러에 사용자 정의 스크립트 등록
2. 특정 시간마다 실행되도록 스케쥴 설정
3. 실행 명령 : sh /volume1/homes/계정명/script/smi2srt/smi2srt.sh


# 수동 실행 방법
1. telnet / ssh 접속 후, smi2srt 입력하여 수동 실행 가능


# charset 변경
charconvert.sh : 자막 깨짐 현상을 방지하기 위해, 기존 존재하던 charset 을 UTF-8 로 변경하는 스크립트 추가

targetdir 을 수정하면 하위 경로의 *.ko.srt 파일을 변경


# 주의사항
잘못 변환이 진행된다면 많은 자막파일이 손상되니 테스트 경로에 자막 파일을 가져다두고 시험 후 전체 적용


# 라이센스
George Shuklin

axfree
