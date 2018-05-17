include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64

SUBPROJECTS = postinst postrm

include $(THEOS_MAKE_PATH)/tool.mk

include $(THEOS_MAKE_PATH)/aggregate.mk
