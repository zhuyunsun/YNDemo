//
//  AppDelegate.m
//  newSDKDemo
//
//  Created by Douglas on 2018/6/29.
//  Copyright © 2018年 Dom. All rights reserved.
//

#import "AppDelegate.h"
#import <V168Core/V168Core.h>
#import "NewViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    NSDictionary *initDict = @{@"Client_id": @"1057",
//                               @"Client_secret": @"DM2yxz2CJd80wecFLJYasg==",
//                               @"AppleID": @"1363065184",
//                               @"Language": @"VN",
//                               @"Currency": @"USD"
//                               };
    NSDictionary *initDict =  @{@"Client_id":@"5021",
     @"Client_secret":@"VyiXTaXyMvzEPOYkrcgepQ==",
     @"AppleID":@"1508940102",
     @"Currency":@"USD",
     @"Language":@"VN"
    };
    [V168Core V168CoreStart].V168Parmas = initDict;
    [[V168Core V168CoreStart] application:application didFinishLaunchingWithOptions:launchOptions];
    
    NewViewController *vc = [[NewViewController alloc]init];
    self.window.rootViewController = vc;

    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[V168Core V168CoreStart] applicationDidBecomeActive:application];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[V168Core V168CoreStart] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    return [[V168Core V168CoreStart] application:app openURL:url options:options];
}

- (BOOL) application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *_Nullable))restorationHandler
{
    [[V168Core V168CoreStart] continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[V168Core V168CoreStart] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}


@end
