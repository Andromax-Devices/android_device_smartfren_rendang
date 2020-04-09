# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

$(call inherit-product, device/smartfren/rendang/full_rendang.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

# Assert
TARGET_OTA_ASSERT_DEVICE := G36C1H,rendang

PRODUCT_NAME := lineage_rendang
BOARD_VENDOR := smartfren
PRODUCT_DEVICE := rendang

PRODUCT_GMS_CLIENTID_BASE := android-haier

# Build fingerprint
BUILD_FINGERPRINT="Smartfren/G36C1H/G36C1H:5.1.1/LMY49J/3d5af498c8:userdebug/test-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="G36C1H-userdebug-5.1.1-LMY49J-3d5af498c8-test-keys"
