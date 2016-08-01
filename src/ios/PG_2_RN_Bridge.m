/********* PG_2_RN_Bridge.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "MainViewController.h"
#import "/Users/gabrieltroia/Projects/jackpocket_reactnative/node_modules/react-native/React/Base/RCTRootView.h"

@interface PG_2_RN_Bridge : CDVPlugin {
  // Member variables go here.
}

- (void)invokeAction:(CDVInvokedUrlCommand*)command;
@end

@implementation PG_2_RN_Bridge

- (void)invokeAction:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
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
        [self.viewController presentViewController:vc animated:YES completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        NSLog(@"PG_2_RN_Bridge: invokeAcion Failed!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)revokeAction:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSDictionary* echo = [command.arguments objectAtIndex:0];

    if (echo != nil) {
        NSLog(@"PG_2_RN_Bridge: revokeAcion Succeeded %@", echo);
        
        [self.viewController dismissViewControllerAnimated:YES completion:Nil];
    } else {
        NSLog(@"PG_2_RN_Bridge: revokeAction Failed!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
