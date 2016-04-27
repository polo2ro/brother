# brother

replacement scripts for my brother DCP-7055W printer/scan installed on debian sid.

Driver root folders: 

* configurations files in /etc/opt/brother
* other files are in /opt/brother


## /scanner/brscan4

contain the scripts based on `scantoocr-0.2.4-1.sh` from the original brother driver package. 
The purpose of the modification is to use the scan to OCR button of the scanner to send the file on a NAS server.
The file is then copied on the consumer folder of the [paperless](https://github.com/danielquinn/paperless) application on the NAS.


## scanner/brscan-skey

`brscan-skey.cfg` config file example, this file should be named with the version number, it replace the default script with the one provided in this package.

The buttons actions will be

**Image** will scan an image and store it in a temporary folder for building a multipage PDF file later

**File** will build a PDF from the images in temporary folder and send it to the paperless consumer folder

**OCR** will scan an image and send it immediatly to the paperless consumer folder

**Email** the default action (no custom script)


## similar projects

[afterdesign/nas-project](https://github.com/afterdesign/nas-project/tree/master/brother/scanner-scripts)
