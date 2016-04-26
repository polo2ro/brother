#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#

#
#       100,200,300,400,600
#

device=$1;



dir=$(dirname "$0")
. $dir/functions.sh

scan_wait

scan_to_image

echo "Page added"
