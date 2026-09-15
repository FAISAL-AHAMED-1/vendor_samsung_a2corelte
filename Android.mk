# Auto-created vendor symlinks from stock vendor.img
include $(CLEAR_VARS)
LOCAL_MODULE := a2corelte_vendor_symlinks
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE):
	@touch $@
