#!/bin/bash

(mkdir test && (echo $"catalog test was created successfully" >> ~/report ; touch test/"$(./concat $"$(date)")"))

ping www.net_nikogo.ru || echo $(date)" ping_error" >> ~/report
