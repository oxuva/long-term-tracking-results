#!/bin/bash

# Example usage:
# bash analyze_web.sh --data=test --challenge=open --loglevel=warning

default_flags="--top=10 --convert_to_png"

set -x

python -m oxuva.tools.analyze table ${default_flags} $@ --iou_thresholds 0.3 0.5 0.7 || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr ${default_flags} $@ --legend_inches=1.8 || exit 1
python -m oxuva.tools.analyze plot_tpr_time ${default_flags} $@ --max_time=300 || exit 1
