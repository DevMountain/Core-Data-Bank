//
//  MemberController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ParentController.h"
#import "DBStack.h"
#import "Child.h"

@interface ParentController ()

@end

@implementation ParentController

+ (ParentController *)sharedInstance {
    static ParentController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ParentController alloc] init];
    });
    return sharedInstance;
}

- (NSArray *)parents {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Parent"];
    NSArray *objects = [[DBStack sharedInstance].managedObjectContext executeFetchRequest:request error:NULL];
    return objects;
    
}

- (Child *)insertChildWithTitle:(NSString*)title
                             parent:(Parent*)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Child *child = [NSEntityDescription insertNewObjectForEntityForName:@"Child"
                                               inManagedObjectContext:managedObjectContext];
    child.title = title;
    child.parent = parent;

    return child;
}

- (Parent *)addParentWithTitle:(NSString *)title {

    Parent *parent = [NSEntityDescription insertNewObjectForEntityForName:@"Parent"
                                                 inManagedObjectContext:[DBStack sharedInstance].managedObjectContext];
    parent.title = title;
    return parent;
}

+ (NSFetchedResultsController *)childrenFetchedResultsControllerForParent:(Parent *)parent {

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", parent];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];

    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:parent.managedObjectContext
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}


@end
