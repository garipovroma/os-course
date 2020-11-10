#!/bin/bash
awk '/<info>/' /var/log/syslog > info.log
