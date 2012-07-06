$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/d2/overlay

PRODUCT_COPY_FILES += \
    device/samsung/d2/prebuilt/init:root/init \
    device/samsung/d2/ramdisk/init.carrier.rc:root/init.carrier.rc \
    device/samsung/d2/ramdisk/ueventd.rc:root/ueventd.rc

# GPS config
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

# Media config
PRODUCT_COPY_FILES += \
    device/samsung/msm8960-common/configs/media_profiles.xml:system/etc/media_profiles.xml

# QC thermald config
PRODUCT_COPY_FILES += device/samsung/msm8960-common/configs/thermald.conf:system/etc/thermald.conf

# vold config
PRODUCT_COPY_FILES += \
    device/samsung/d2/configs/vold.fstab:system/etc/vold.fstab

# wifi config
PRODUCT_COPY_FILES += \
    device/samsung/d2/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/samsung/d2/dsp/Call_DL_Rec:/system/etc/snd_soc_msm/Call_DL_Rec \
    device/samsung/d2/dsp/Call_UL_DL_Rec:/system/etc/snd_soc_msm/Call_UL_DL_Rec \
    device/samsung/d2/dsp/DSP_Loopback:/system/etc/snd_soc_msm/DSP_Loopback \
    device/samsung/d2/dsp/HiFi:/system/etc/snd_soc_msm/HiFi \
    device/samsung/d2/dsp/HiFi_Low_Power:/system/etc/snd_soc_msm/HiFi_Low_Power \
    device/samsung/d2/dsp/HiFi_Rec:/system/etc/snd_soc_msm/HiFi_Rec \
    device/samsung/d2/dsp/HiFi_Voice_Recognition:/system/etc/snd_soc_msm/HiFi_Voice_Recognition \
    device/samsung/d2/dsp/Loopback:/system/etc/snd_soc_msm/Loopback \
    device/samsung/d2/dsp/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/samsung/d2/dsp/Video_Call:/system/etc/snd_soc_msm/Video_Call \
    device/samsung/d2/dsp/Voice_Call1:/system/etc/snd_soc_msm/Voice_Call1 \
    device/samsung/d2/dsp/VoIP1:/system/etc/snd_soc_msm/VoIP1 \
    device/samsung/d2/dsp/VoIP2:/system/etc/snd_soc_msm/VoIP2 \
    device/samsung/d2/dsp/VoIP3:/system/etc/snd_soc_msm/VoIP3 \
    device/samsung/d2/dsp/VoIP4:/system/etc/snd_soc_msm/VoIP4 \
    device/samsung/d2/dsp/VoIP5:/system/etc/snd_soc_msm/VoIP5 

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/samsung/d2/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/d2/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    device/samsung/d2/keylayout/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    device/samsung/d2/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/samsung/d2/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/samsung/d2/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/d2/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    device/samsung/d2/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/d2/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/d2/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/d2/d2-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_NAME := d2
