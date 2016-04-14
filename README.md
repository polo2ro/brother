# brother

replacement scripts for my brother DCP-7055W printer/scan installed on debian sid.

Driver root folder: /etc/opt/brother


## /scanner/brscan4

`scantoocr.sh` is a script based on `scantoocr-0.2.4-1.sh` from the original brother driver package. 
The purpose of the modification is to use the scan to OCR button of the scanner to send the file on a NAS server.
The file is then copied on the consumer folder of the [paperless](https://github.com/danielquinn/paperless) application on the NAS.