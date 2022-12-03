#import <dlfcn.h>
#import <substrate.h>

BOOL (*DeviceSupportsVFX)(void);
%hookf(BOOL, DeviceSupportsVFX) {
	return YES;
}

BOOL (*DeviceSupportsMaterialBackgrounds)(void);
%hookf(BOOL, DeviceSupportsMaterialBackgrounds) {
	return YES;
}

BOOL (*TUDeviceIsSlow)(void);
%hookf(BOOL, TUDeviceIsSlow) {
	return NO;
}

%ctor {
	dlopen("/System/Library/PrivateFrameworks/WeatherUI.framework/WeatherUI", RTLD_LAZY);
	dlopen("/System/Library/PrivateFrameworks/TeaUI.framework/TeaUI", RTLD_LAZY);
	MSImageRef weatherUI = MSGetImageByName("/System/Library/PrivateFrameworks/WeatherUI.framework/WeatherUI");
	MSImageRef teaUI = MSGetImageByName("/System/Library/PrivateFrameworks/TeaUI.framework/TeaUI");
	DeviceSupportsVFX = (BOOL (*)(void))MSFindSymbol(weatherUI, "_DeviceSupportsVFX");
	DeviceSupportsMaterialBackgrounds = (BOOL (*)(void))MSFindSymbol(weatherUI, "_DeviceSupportsMaterialBackgrounds");
	TUDeviceIsSlow = (BOOL (*)(void))MSFindSymbol(teaUI, "_TUDeviceIsSlow");
	%init;
}