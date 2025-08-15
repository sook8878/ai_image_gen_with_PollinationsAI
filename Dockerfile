FROM python:3.9.6

# 컨테이너 안에서의 작업 디렉토리
# Docker는 내 로컬 장고 프로젝트 안에서 실행되는게 아니라,
# 장고 프로젝트를 복사해서 컨테이너 안의 WORKDIR 경로 폴더에서 실행 됨.
WORKDIR /app

# /app 경로 하위에 requirements 파일 카피
COPY requirements.txt /app/

# Docker 컨테이너 안에서, requirement를 읽어서 그 안의 적힌 모든 python 패키지를 pip로 인스톨 하는 명령어
RUN pip install -r requirements.txt

# 현재 경로 장고프로젝트 코드 전체를 /app 경로 하위에 카피
COPY . /app/

# 포트 열기
EXPOSE 8100

# CMD 명령어 - Dockerfile 엔 하나의 CMD 명령어만 존재.
# 0.0.0.0 -> 모든 IP 주소에서 접근 가능 하도록 설정
#         => 컨테이너 내부에서 실행되기 때문에 127.0.0.1 은 자기자신. 즉 컨테이너 내부에서만 접속가능하고, 내 로컬PC에서는 접속 불가
# 쌍따옴표로 해아됨. -> json 형식이기 때문.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8100"]

