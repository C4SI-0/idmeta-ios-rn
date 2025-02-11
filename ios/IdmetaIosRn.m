@import Flutter;
@import UIKit;
#import "IdmetaIosRn.h"

static FlutterEngine *_flutterEngine = nil;

@implementation IdmetaIosRn

RCT_EXPORT_MODULE(IdmetaIosRn)

+ (void)initWithFlutterEngine:(FlutterEngine * _Nonnull)flutterEngine {
    _flutterEngine = flutterEngine;
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize Flutter Engine if not provided externally
        if (_flutterEngine == nil) {
            _flutterEngine = [[FlutterEngine alloc] initWithName:@"my_engine_id"];
            [_flutterEngine runWithEntrypoint:nil];
            [GeneratedPluginRegistrant registerWithRegistry:_flutterEngine];
        }
    }
    return self;
}

RCT_EXPORT_METHOD(startActivity:(NSString *)flowId userToken:(NSString *)userToken callback:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        FlutterViewController *flutterViewController;

        if (_flutterEngine == nil) {
            _flutterEngine = [[FlutterEngine alloc] initWithName:@"my_engine_id"];
            [_flutterEngine runWithEntrypoint:nil];
            [GeneratedPluginRegistrant registerWithRegistry:_flutterEngine];
        }

        flutterViewController = [[FlutterViewController alloc] initWithEngine:_flutterEngine nibName:nil bundle:nil];

        // Register MethodChannel for data communication
        FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.idmetareactnative/data"
                                                                    binaryMessenger:flutterViewController.binaryMessenger];

        // Send the flowId and userToken to Flutter
        [channel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
            if ([call.method isEqualToString:@"getData"]) {
                NSDictionary *data = @{
                    @"flowId": flowId,
                    @"userToken": userToken
                };
                result(data);
            } else {
                result(FlutterMethodNotImplemented);
            }
        }];

        [flutterViewController setModalPresentationStyle:UIModalPresentationFullScreen];

        UIViewController *rootController = UIApplication.sharedApplication.delegate.window.rootViewController;
        [rootController presentViewController:flutterViewController animated:YES completion:nil];

        callback(@[[NSString stringWithFormat:@"FlowId: %@, UserToken: %@", flowId, userToken]]);
    });
}
@end