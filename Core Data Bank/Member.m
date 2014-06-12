//
//  Member.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "Member.h"
#import "Member.h"


@implementation Member

@dynamic title;
@dynamic parent;
@dynamic children;

- (NSInteger)numberOfChildren {
    return self.children.count;
}

- (NSFetchedResultsController*)childrenFetchedResultsController
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", self];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:self.managedObjectContext
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}

@end
