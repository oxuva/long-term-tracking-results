#!/bin/bash

# Example usage:
# bash analyze_paper.sh --data=test --challenge=open --loglevel=warning

default_flags="--top=10"

# To enable posthoc thresholding use the following line.
# This will assess each frame rather than use the assessment summary (only possible for dev set).
# It is also much slower!
# posthoc_flags="--no_use_summary"

set -x

python -m oxuva.tools.analyze table ${default_flags} $@ --iou_thresholds 0.3 0.5 0.7 || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr ${default_flags} $@ --legend_inches=1.8 ${posthoc_flags} || exit 1
# python -m oxuva.tools.analyze plot_tpr_tnr_intervals ${default_flags} $@ || exit 1
python -m oxuva.tools.analyze plot_tpr_time ${default_flags} $@ --max_time=300 || exit 1
python -m oxuva.tools.analyze plot_present_absent ${default_flags} $@ || exit 1
