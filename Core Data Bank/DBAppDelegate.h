//
//  DBAppDelegate.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DBStack.h"

@interface DBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DBStack *stack;

@end
