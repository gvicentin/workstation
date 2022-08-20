#!/usr/bin/env bash

#   Configure single and dual monitor setup
#
#   Exit(s) status code(s)
#   0 - success
#   1 - fail

# ======================================
#   Debug
# ======================================
if [ "${DEBUG}" = true ]; then

    # enable debug mode
    set -x
    export
    whoami

else

  # unset if flag is not set
  unset DEBUG

fi

# ======================================
#   Setup
# ======================================

# set default options
set -o errexit
set -o pipefail
set -o nounset

# parameters
__primary=${1:-'eDP-1'}
__second=${2:-'HDMI-1'}

# check binaries
__FIND=$(which find)
__BASENAME=$(which basename)

# variables
readonly __bindir='bin'


