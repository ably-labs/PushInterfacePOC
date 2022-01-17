#import "OurpluginPlugin.h"
#if __has_include(<ourplugin/ourplugin-Swift.h>)
#import <ourplugin/ourplugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ourplugin-Swift.h"
#endif

@implementation OurpluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOurpluginPlugin registerWithRegistrar:registrar];
}
@end
