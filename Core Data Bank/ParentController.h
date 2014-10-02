//
//  MemberController.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"
#import "Child.h"

@interface ParentController : NSObject

+ (ParentController *)sharedInstance;

- (NSArray *)parents;

- (Parent *)addParentWithTitle:(NSString *)title;
- (Child *)insertChildWithTitle:(NSString*)title
                           parent:(Parent*)parent
           inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
