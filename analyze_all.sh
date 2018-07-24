#!/bin/bash

set -x

# Example usage:
# bash analyze_all.sh --loglevel=warning --top=10 --convert_to_png --data=dev --challenge=constrained
# bash analyze_all.sh --loglevel=warning --top=10 --convert_to_png --data=dev --challenge=open
# bash analyze_all.sh --loglevel=warning --top=10 --convert_to_png --data=test --challenge=constrained
# bash analyze_all.sh --loglevel=warning --top=10 --convert_to_png --data=test --challenge=open

# To enable posthoc thresholding use the following line.
# This will assess each frame rather than use the assessment summary (only possible for dev set).
# It is also much slower!
# posthoc_flags="--no_use_summary"

python -m oxuva.tools.analyze table $@ --iou_thresholds 0.3 0.5 0.7 || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr $@ --legend_inches=1.8 --iou_thresholds 0.3 0.5 0.7 ${posthoc_flags} || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr_intervals $@ || exit 1
python -m oxuva.tools.analyze plot_tpr_time $@ --max_time=300 || exit 1
python -m oxuva.tools.analyze plot_present_absent $@ --iou_thresholds 0.3 0.5 0.7 || exit 1
