#
# Copyright 2018 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := PNX

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Define time zone data path
ifneq ($(wildcard bionic/libc/zoneinfo),)
    TZDATAPATH := bionic/libc/zoneinfo
else ifneq ($(wildcard system/timezone),)
    TZDATAPATH := system/timezone/output_data/iana
endif

# Time Zone data for Recovery
ifdef TZDATAPATH
PRODUCT_COPY_FILES += \
    $(TZDATAPATH)/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
endif

# add support for future ota updates
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0
    
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="PNX" \
    PRODUCT_NAME="PNX" \

# A/B device flags
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.sdm710

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm710 \
    libcutils \
    libgptutils \
    libz

# Treble Enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Init
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

## Device identifier. This must come after all inclusions	
PRODUCT_NAME := omni_PNX
PRODUCT_DEVICE := PNX
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := fih_sdm710
PRODUCT_MANUFACTURER := FIH
