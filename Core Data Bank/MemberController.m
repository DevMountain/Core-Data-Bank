//
//  MemberController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MemberController.h"
#import "DBStack.h"

#import "DBAppDelegate.h"

@interface MemberController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation MemberController

+ (MemberController *)sharedInstance {
    static MemberController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MemberController alloc] init];
        DBAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        
        sharedInstance.managedObjectContext = appDelegate.stack.managedObjectContext;
    });
    return sharedInstance;
}

- (Member*)rootMember
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", nil];

    NSArray* objects = [self.managedObjectContext  executeFetchRequest:request error:NULL];

    Member* rootMember = [objects lastObject];
    
    if (rootMember == nil) {
        rootMember = [MemberController insertMemberWithTitle:nil parent:nil inManagedObjectContext:self.managedObjectContext];
    }
    return rootMember;
}

+ (Member *)insertMemberWithTitle:(NSString*)title
                             parent:(Member*)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Member* member = [NSEntityDescription insertNewObjectForEntityForName:@"Member"
                                               inManagedObjectContext:managedObjectContext];
    member.title = title;
    member.parent = parent;

    return member;
}

                        
                        
@end
