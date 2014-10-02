//
//  DBAppDelegate.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBAppDelegate.h"
#import "ListViewController.h"

#import "DBStack.h"
#import "ParentController.h"

@implementation DBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ListViewController *memberViewController = [ListViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[DBStack sharedInstance].managedObjectContext save:NULL];
}

@end
