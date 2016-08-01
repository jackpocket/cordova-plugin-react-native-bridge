/********* PG_2_RN_Bridge.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface PG_2_RN_Bridge : CDVPlugin {
  // Member variables go here.
}

- (void)invokeAcion:(CDVInvokedUrlCommand*)command;
@end

@implementation PG_2_RN_Bridge

- (void)invokeAcion:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        NSLog(@"PG_2_RN_Bridge: invokeAcion Failed");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        NSLog(@"PG_2_RN_Bridge: invokeAcion Succeeded!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
