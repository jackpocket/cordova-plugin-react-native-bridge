/********* PG_2_RN_Bridge.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "MainViewController.h"
// Use a more dynamic path
#import "~/Projects/jackpocket_reactnative/node_modules/react-native/React/Base/RCTRootView.h"

@interface PG_2_RN_Bridge : CDVPlugin {
  // Member variables go here.
}

- (void)invokeAction:(CDVInvokedUrlCommand*)command;
- (void)revokeAction:(CDVInvokedUrlCommand*)command;
@end

@implementation PG_2_RN_Bridge

- (void)invokeAction:(CDVInvokedUrlCommand*)command
{
    NSDictionary* echo = [command.arguments objectAtIndex:0];

    if (echo != nil) {
        NSLog(@"PG_2_RN_Bridge: invokeAcion Succeeded %@", echo);
        
        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
        RCTRootView *rootView =
        [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                             moduleName        : @"jackpocket_reactnative"
                             initialProperties : echo
                              launchOptions    : nil];
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view = rootView;
        vc.view.backgroundColor = [UIColor clearColor];

        PG_2_RN_Bridge* __weak weakSelf = self;
        [self.viewController presentViewController:vc animated:YES completion:^{
            CDVPluginResult* pluginResultOK = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [weakSelf.commandDelegate sendPluginResult:pluginResultOK
                                            callbackId:command.callbackId];
            NSLog(@"PG_2_RN_Bridge: VIEW CONTROLLER LOADED AFTER!");
        }];
    } else {
        NSLog(@"PG_2_RN_Bridge: invokeAcion Failed!");
        CDVPluginResult* pluginResultERROR = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResultERROR 
                                    callbackId:command.callbackId];
    }
}

- (void)revokeAction:(CDVInvokedUrlCommand*)command
{
    NSDictionary* echo = [command.arguments objectAtIndex:0];

    if (echo != nil) {
        NSLog(@"PG_2_RN_Bridge: revokeAcion Succeeded %@", echo);
        
        PG_2_RN_Bridge* __weak weakSelf = self;
        [self.viewController dismissViewControllerAnimated:YES completion:^{
            CDVPluginResult* pluginResultOK = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [weakSelf.commandDelegate sendPluginResult:pluginResultOK
                                            callbackId:command.callbackId];
            NSLog(@"PG_2_RN_Bridge: VIEW CONTROLLER DISMISSED AFTER!");
        }];
    } else {
        NSLog(@"PG_2_RN_Bridge: revokeAction Failed!");
        CDVPluginResult* pluginResultERROR = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResultERROR
                                    callbackId:command.callbackId];
    }
}

@end
