//
//  MemberController.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface MemberController : NSObject

+ (MemberController *)sharedInstance;

- (Member *)rootMember;

+ (Member *)insertMemberWithTitle:(NSString*)title
                           parent:(Member*)parent
           inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
