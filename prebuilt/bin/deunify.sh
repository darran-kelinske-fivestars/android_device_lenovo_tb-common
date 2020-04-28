#!/sbin/sh
baseband="";
for e in $(cat /proc/cmdline);
do
    tmp=$(echo $e | grep "androidboot.baseband" > /dev/null);
    if [ "0" == "$?" ]; then
        baseband=$(echo $e |cut -d":" -f1 |cut -d"=" -f2);
    fi
done

# Move variant-specific blobs
mv /system/vendor/firmware/variant/$baseband/a506_zap* /system/vendor/firmware/
mv /system/vendor/firmware/variant/$baseband/goodixfp* /system/vendor/firmware/
rm -rf /system/vendor/firmware/variant

# Remove telephony files for wifi variant
if [ "$baseband" == "apq" ]; then 
#     rm -rf /system/app/QtiTelephonyService
fi
