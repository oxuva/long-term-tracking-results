#!/bin/bash

set -x

python -m oxuva.tools.analyze table $@ --iou_thresholds 0.3 0.5 0.7 || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr $@ || exit 1
python -m oxuva.tools.analyze plot_tpr_tnr_intervals $@ || exit 1
python -m oxuva.tools.analyze plot_tpr_time $@ --max_time=300 || exit 1
python -m oxuva.tools.analyze plot_present_absent $@ || exit 1
