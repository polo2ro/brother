#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#

#
#       100,200,300,400,600
#
resolution=300
device=$1
mkdir -p ~/brscan
if [ "`which usleep  2>/dev/null `" != '' ];then
    usleep 100000
else
    sleep  0.1
fi
output_file=~/brscan/"Scan - "`date +%Y%m%d%H%M%S`".jpg"
echo "scan from $2($device) to $output_file"
scanimage --device-name "$device" --resolution $resolution| pnmtojpeg > "$output_file"  2>/dev/null
if [ ! -s "$output_file" ];then
  if [ "`which usleep  2>/dev/null `" != '' ];then
    usleep 1000000
  else
    sleep  1
  fi
  scanimage --device-name "$device" --resolution $resolution | pnmtojpeg> "$output_file"  2>/dev/null
fi


# upload to paperless consume folder
scp "$output_file" paul@nas.local:/var/share/paperless

# make it deletable by paperless
ssh paul@nas.local "chmod -R 776 /var/share/paperless"

rm -f "$output_file"
