#!/bin/bash

# 사용자 프로파일 로드
. ~user1/.bash_profile

# Redis CLI를 사용하여 백그라운드에서 스냅샷 생성
docker exec study-redis redis-cli BGSAVE

# 백그라운드 세이브 작업이 완료될 때까지 대기
sleep 10

# 현재 시간을 이용하여 백업 파일명 생성
backup_filename="dump_$(date +"%Y%m%d%H%M%S").rdb"

# 생성된 스냅샷 파일을 호스트의 안전한 위치로 복사
docker cp study-redis:/data/dump.rdb "/home/ubuntu/CStudy_Infra/$backup_filename"
