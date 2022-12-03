TARGET := iphone:clang:latest:15.0
ARCHS = arm64
INSTALL_TARGET_PROCESSES = Weather

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HighWeather

HighWeather_FILES = Tweak.x
HighWeather_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
