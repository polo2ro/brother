#! /bin/sh
resolution=300;

scan_wait () {
    if [ "`which usleep  2>/dev/null `" != '' ]
    then
        usleep 1000000
    else
        sleep  1
    fi
}

merge_pages () {
    merge_output_file=~/brscan/"Scan - "`date +%Y%m%d%H%M%S`".pdf"
    convert -density 300 ~/brscan/*.jpg "$merge_output_file" 2>&1 >/dev/null
    if [ $? -eq 0 ]
    then
        rm -rf ~/brscan/*.jpg;
    fi

    echo "$merge_output_file";
}

scan_to_image () {

    if [ -z "$device" ]
    then
        echo "No device supplied"
        exit 1
    fi

    mkdir -p ~/brscan

    output_file=~/brscan/"Scan - "`date +%Y%m%d%H%M%S`".jpg"
    scanimage --device-name "$device" --resolution $resolution | pnmtojpeg> "$output_file" 2>/dev/null
    echo "$output_file";
}


send_to_paperless () {

    if [ -z "$1" ]
    then
        echo "No input file supplied"
        exit 1
    fi

    # upload to paperless consume folder
    scp "$1" paul@nas.local:/var/share/paperless

    # make it deletable by paperless
    ssh paul@nas.local "chmod -R 776 /var/share/paperless"

    rm -f "$1"
}
