# Redis 데이터 백업
---

### 1. 현재 Docker로 실행되는 Redis의 데이터를 BGSAVE

```bash
#!/bin/bash

# Redis CLI를 사용하여 백그라운드에서 스냅샷 생성
docker exec -it study-redis redis-cli BGSAVE

# 백그라운드 세이브 작업이 완료될 때까지 대기
sleep 10

# 현재 시간을 이용하여 백업 파일명 생성
backup_filename="dump_$(date +"%Y%m%d%H%M%S").rdb"

# 생성된 스냅샷 파일을 호스트의 안전한 위치로 복사
docker cp study-redis:/data/dump.rdb "/home/ec2-user/CStudy_BackEnd/redis_backup/$backup_filename"

```

### 2. Corn

```bash
## Corn 추가
sudo yum install cronie

### 새로운 화면에 
0 2 * * * /home/ec2-user/CStudy_BackEnd/redis_backup/redis_backup_script.sh

```

