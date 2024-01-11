
#!/bin/bash

# 33명의 이름이 있는 배열
names=("Name1" "Name2" "Name3" "Name4" "Name5" "Name6" "Name7" "Name8" "Name9" "Name10" "Name11" "Name12" "Name13" "Name14" "Name15" "Name16" "Name17" "Name18" "Name19" "Name20" "Name21" "Name22" "Name23" "Name24" "Name25" "Name26" "Name27" "Name28" "Name29")

# Fisher-Yates 알고리즘을 사용하여 배열 섞기
len=${#names[@]}
for ((i=len-1; i>0; i--)); do
    j=$((RANDOM % (i+1)))
    # Swap names[i] and names[j]
    temp=${names[i]}
    names[i]=${names[j]}
    names[j]=$temp
done

# 조 수
num_teams=6

# 각 조의 맴버 수 계산
members_per_team=$(( (len + num_teams - 1) / num_teams ))

# 각 조의 맴버를 문자열로 정리
team_members_str=""
for ((i=0; i<num_teams; i++)); do
    case $((i+1)) in
        1) team_name="1️⃣ 1조 (조장: ) - "
        2) team_name="2️⃣ 2조 (조장: ) - "
        3) team_name="3️⃣ 3조 (조장: ) - "
        4) team_name="4️⃣ 4조 (조장: ) - "
        5) team_name="5️⃣ 5조 (조장: ) - "
        6) team_name="6️⃣ 6조 (조장: ) - "
    team_members_str+="$team_name ${names[@]:i*members_per_team:members_per_team} |✨ "
done
# 정리된 문자열 출력
echo -e "$team_members_str"
