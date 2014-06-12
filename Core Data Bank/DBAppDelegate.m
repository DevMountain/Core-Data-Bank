//
//  DBAppDelegate.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBAppDelegate.h"
#import "DBMemberViewController.h"

#import "MemberController.h"

@implementation DBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.stack = [DBStack new];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    DBMemberViewController *memberViewController = [DBMemberViewController new];
    memberViewController.member = [[MemberController sharedInstance] rootMember];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.stack.managedObjectContext save:NULL];
}

@end
