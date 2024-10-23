#!/bin/bash

# 서울 시간대 설정
TZ='Asia/Seoul'
export TZ

# 현재 시간을 연월일시분초 형식으로 포맷
CURRENT_TIME=$(date +"%Y%m%d%H%M%S")

# 압축 파일 이름 설정 (현재 시간 포함)
ARCHIVE_NAME="../backup-LogicKor-${CURRENT_TIME}.tar.gz"

# 제외할 디렉토리 또는 파일 목록 설정
EXCLUDES=("wandb" ".cache" ".venv" ".git" ".github")

# tar 명령어 시작
TAR_CMD="tar -czvf $ARCHIVE_NAME"

# 제외할 항목들을 tar 명령어에 추가
for EXCLUDE in "${EXCLUDES[@]}"
do
  TAR_CMD+=" --exclude=$EXCLUDE"
done

# 현재 디렉토리의 모든 파일 및 폴더를 압축하되, 특정 디렉토리 및 파일 제외
$TAR_CMD .
