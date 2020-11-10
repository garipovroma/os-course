#!/bin/bash

grep "WW" /var/log/Xorg.0.log | awk '{gsub(/(WW)/, "Warning:"); print}' > full.log
grep "II" /var/log/Xorg.0.log | awk '{gsub(/(II)/, "Information:"); print}' >> full.log
cat full.log
