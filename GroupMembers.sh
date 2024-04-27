#!/bin/bash
cat /etc/group | grep webAdmins | cut -d: -f4

