#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#

#
#       100,200,300,400,600
#

dir=$(dirname "$0")
. $dir/functions.sh

scan_wait

pdf=$(merge_pages)

send_to_paperless "$pdf"
