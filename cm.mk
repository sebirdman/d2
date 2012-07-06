# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := d2

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/d2/device_d2.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d2
PRODUCT_NAME := cm_d2
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SCH-T999
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9300 TARGET_DEVICE=GT-I9300 BUILD_FINGERPRINT="samsung/m0xx/m0:4.0.4/IMM76D/I9300XXALE8:user/release-keys" PRIVATE_BUILD_DESC="m0xx-user 4.0.4 IMM76D I9300XXALE8 release-keys"
