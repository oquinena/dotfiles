#!/bin/bash

uptime -p | awk '{print $2"h" $4"m"}'
