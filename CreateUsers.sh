#!/bin/bash
declare -a users=("DevTeam" "OpsTeam")
groupadd webAdmins
for user in "${users[@]}"
do
  useradd "$user"
  usermod -aG webAdmins "$user"
done
