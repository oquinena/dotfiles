#!/bin/bash

env CURRENT_ID=$(mysql -u root -pbrut84us! -h 192.168.200.30 -D bugtracker -s -e"SELECT id FROM mantis_bug_table ORDER BY id DESC LIMIT 1;") 


