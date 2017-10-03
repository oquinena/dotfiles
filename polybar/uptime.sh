#!/bin/bash

tid=$("awk '{print $0/3600;}' /proc/uptime")

echo tid
